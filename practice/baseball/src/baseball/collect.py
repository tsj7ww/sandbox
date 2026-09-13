"""Enhanced baseball data collection module.

This module handles comprehensive collection of baseball statistics, weather data, 
and betting odds. It implements caching to avoid redundant API calls and collects
a wider range of statistics including advanced metrics, player histories, and 
team-level data.

Example:
    >>> collector = DataCollector(config_path='config.yaml')

    >>> data = collector.collect_data('2024-01-01', '2024-01-31')

    >>> data.to_parquet('data/baseball_data.parquet')
"""

import json
import logging
import os
import time
from datetime import datetime, timedelta
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple, Union

import pandas as pd
import requests
import yaml
from pandas import DataFrame
from requests.adapters import HTTPAdapter
from requests.packages.urllib3.util.retry import Retry
from tqdm import tqdm

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler(Path(__file__) / '../logs/baseball_collection.log'),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)

class DataCache:
    """Manages data caching to avoid redundant API calls."""
    
    def __init__(self, cache_dir: Union[str, Path] = 'data'):
        """
        Initialize the data cache.
        
        Args:
            cache_dir: Directory for storing cached data
        """
        self.cache_dir = Path(cache_dir)
        self.cache_dir.mkdir(parents=True, exist_ok=True)
        
        # Create subdirectories for different data types
        self.game_dir = self.cache_dir / 'games'
        self.player_dir = self.cache_dir / 'players'
        self.weather_dir = self.cache_dir / 'weather'
        self.odds_dir = self.cache_dir / 'odds'
        
        for directory in [self.game_dir, self.player_dir, 
                         self.weather_dir, self.odds_dir]:
            directory.mkdir(exist_ok=True)
    
    def get_cached_dates(self, data_type: str) -> Set[str]:
        """Get dates for which we have cached data."""
        cache_path = getattr(self, f"{data_type}_dir")
        files = cache_path.glob('*.parquet')
        return {f.stem for f in files}
    
    def read_cache(self, data_type: str, date: str) -> Optional[DataFrame]:
        """Read cached data if it exists."""
        cache_path = getattr(self, f"{data_type}_dir") / f"{date}.parquet"
        if cache_path.exists():
            return pd.read_parquet(cache_path)
        return None
    
    def write_cache(self, data: DataFrame, data_type: str, date: str):
        """Write data to cache."""
        cache_path = getattr(self, f"{data_type}_dir") / f"{date}.parquet"
        data.to_parquet(cache_path)

class RateLimitedSession:
    def __init__(self, calls_per_second: float):
        self.min_interval = 1.0 / calls_per_second
        self.last_call = 0.0
        
        # Configure retry strategy
        retry_strategy = Retry(
            total=3,
            backoff_factor=1,
            status_forcelist=[429, 500, 502, 503, 504]
        )
        
        self.session = requests.Session()
        adapter = HTTPAdapter(max_retries=retry_strategy)
        self.session.mount("http://", adapter)
        self.session.mount("https://", adapter)
    
    def get(self, *args, **kwargs):
        # Implement rate limiting
        current_time = time.time()
        sleep_duration = self.min_interval - (current_time - self.last_call)
        if sleep_duration > 0:
            time.sleep(sleep_duration)
        
        response = self.session.get(*args, **kwargs)
        self.last_call = time.time()
        return response

class BaseballDataCollector:
    """Collects comprehensive baseball statistics and game data."""
    
    def __init__(self, api_key: str, base_url: str, cache: DataCache):
        """
        Initialize baseball data collector.
        
        Args:
            api_key: API key for baseball data service
            base_url: Base URL for API endpoints
            cache: DataCache instance for managing cached data
        """
        self.api_key = api_key
        self.base_url = base_url
        self.cache = cache
        self.session = RateLimitedSession(calls_per_second=2)
    
    def get_games(self, start_date: str, end_date: str) -> DataFrame:
        """
        Collect game data for a date range, using cache when possible.
        
        Args:
            start_date: Start date in YYYY-MM-DD format
            end_date: End date in YYYY-MM-DD format
            
        Returns:
            DataFrame containing game data
        """
        dates = pd.date_range(start_date, end_date)
        cached_dates = self.cache.get_cached_dates('games')
        
        all_games = []
        dates = pd.date_range(start_date, end_date)
                
        for date in tqdm(dates, desc="Collecting game data"):
            date_str = date.strftime('%Y-%m-%d')
            
            # Check cache first
            if date_str in cached_dates:
                games = self.cache.read_cache('games', date_str)
                all_games.append(games)
                continue
            
            # Collect from API if not cached
            try:
                games = self._collect_daily_games(date_str)
                if not games.empty:
                    all_games.append(games)
            except Exception as e:
                logger.error(f"Failed to collect games for {date_str}: {e}")
        
        if not all_games:
            raise ValueError("No valid game data collected for the specified period")

        return pd.concat(all_games, ignore_index=True)
    
    def _collect_daily_games(self, date: str) -> DataFrame:
        """Collect all games for a specific date."""
        games = self._get_basic_game_info(date)
        
        # Enhance with additional data
        games = self._add_team_stats(games)
        games = self._add_starting_pitchers(games)
        games = self._add_batting_orders(games)
        games = self._add_stadium_factors(games)
        
        return games
    
    def _get_basic_game_info(self, date: str) -> DataFrame:
        """Collect basic game information."""
        url = f"{self.base_url}/games"
        params = {'api_key': self.api_key, 'date': date}
        
        try:
            response = self.session.get(url, params=params)
            response.raise_for_status()  # Raise error for bad status codes
            data = response.json()
            
            if 'games' not in data:
                raise ValueError(f"Unexpected API response format: {data}")
                
            return pd.DataFrame(data['games'])
        except requests.exceptions.RequestException as e:
            logger.error(f"API request failed for {date}: {e}")
            raise
        except (ValueError, KeyError) as e:
            logger.error(f"Failed to parse API response for {date}: {e}")
            raise
    
    def _add_team_stats(self, games: DataFrame) -> DataFrame:
        """Add team-level statistics."""
        # Add rolling performance metrics
        team_stats = self._get_team_stats(games['home_team'].unique())
        return games.merge(team_stats, on='home_team', how='left')
    
    def _add_starting_pitchers(self, games: DataFrame) -> DataFrame:
        """Add starting pitcher information and statistics."""
        pitcher_stats = self._get_pitcher_stats(games['game_id'])
        return games.merge(pitcher_stats, on='game_id', how='left')
    
    def _add_batting_orders(self, games: DataFrame) -> DataFrame:
        """Add batting order and player statistics."""
        batting_stats = self._get_batting_stats(games['game_id'])
        return games.merge(batting_stats, on='game_id', how='left')
    
    def _add_stadium_factors(self, games: DataFrame) -> DataFrame:
        """Add stadium-specific factors."""
        stadium_factors = self._get_stadium_factors(games['stadium'].unique())
        return games.merge(stadium_factors, on='stadium', how='left')
    
    def get_player_stats(self, game_ids: List[str]) -> DataFrame:
        """
        Collect comprehensive player statistics.
        
        This includes:
        - Basic batting/pitching stats
        - Advanced metrics (xwOBA, Barrel%, etc.)
        - Recent performance trends
        - Matchup history
        """
        all_stats = []
        
        for game_id in tqdm(game_ids, desc="Collecting player stats"):
            # Check cache first
            cached_stats = self.cache.read_cache('players', game_id)
            if cached_stats is not None:
                all_stats.append(cached_stats)
                continue
            
            try:
                # Collect comprehensive player stats
                game_stats = self._collect_player_stats(game_id)
                self.cache.write_cache(game_stats, 'players', game_id)
                all_stats.append(game_stats)
            except Exception as e:
                logger.error(f"Failed to collect player stats for {game_id}: {e}")
        
        return pd.concat(all_stats, ignore_index=True)
    
    def _collect_player_stats(self, game_id: str) -> DataFrame:
        """Collect detailed player statistics for a game."""
        stats = pd.DataFrame()
        
        # Basic stats
        basic_stats = self._get_basic_player_stats(game_id)
        
        # Advanced metrics
        advanced_stats = self._get_advanced_metrics(game_id)
        
        # Matchup history
        matchup_stats = self._get_matchup_history(game_id)
        
        # Recent performance
        recent_stats = self._get_recent_performance(game_id)
        
        # Combine all stats
        stats = (basic_stats
                .merge(advanced_stats, on=['game_id', 'player_id'])
                .merge(matchup_stats, on=['game_id', 'player_id'])
                .merge(recent_stats, on=['game_id', 'player_id']))
        
        return stats

class WeatherCollector:
    None



class OddsCollector:
    """Collects comprehensive betting odds and line movements."""
    
    def __init__(
        self,
        api_keys: Dict[str, str],
        cache: DataCache
    ):
        """Initialize odds collector with caching."""
        self.api_keys = api_keys
        self.cache = cache
        self.session = RateLimitedSession(calls_per_second=0.5)
    
    def get_odds(
        self,
        game_id: str,
        use_cache: bool = True
    ) -> Dict:
        """
        Get comprehensive betting data for a game.
        
        Collects:
        - Money line odds
        - Run lines and totals
        - Alternative lines
        - Line movements
        - Public betting percentages
        - Sharp money indicators
        """
        # Check cache first
        if use_cache:
            cached_odds = self.cache.read_cache('odds', game_id)
            if cached_odds is not None:
                return cached_odds.to_dict('records')[0]
        
        odds_data = {}
        for sportsbook, api_key in self.api_keys.items():
            try:
                sportsbook_odds = self._get_comprehensive_odds(
                    sportsbook,
                    api_key,
                    game_id
                )
                odds_data[sportsbook] = sportsbook_odds
            except Exception as e:
                logger.error(f"Failed to get odds from {sportsbook}: {e}")
        
        # Cache the new data
        if use_cache and odds_data:
            self.cache.write_cache(
                pd.DataFrame([odds_data]),
                'odds',
                game_id
            )
        
        return odds_data

class DataCollector:
    """Main class that orchestrates all data collection."""
    
    def __init__(self, config_path: Union[str, Path]):
        """Initialize with configuration and caching."""
        self.config = self._load_config(config_path)
        self.cache = DataCache(self.config.get('cache_dir', 'data'))
        
        # Initialize collectors with cache
        self.baseball_collector = BaseballDataCollector(
            api_key=self.config['baseball_api_key'],
            base_url=self.config['baseball_base_url'],
            cache=self.cache
        )
        
        self.weather_collector = WeatherCollector(
            api_key=self.config['weather_api_key'],
            backup_api_key=self.config.get('backup_weather_api_key'),
            cache=self.cache
        )
        
        self.odds_collector = OddsCollector(
            api_keys=self.config['sportsbook_api_keys'],
            cache=self.cache
        )
    
    def _load_config(self, config_path: Union[str, Path]) -> Dict:
        """Load configuration from YAML file."""
        with open(config_path, 'r') as file:
            config = yaml.safe_load(file)
        return config
    
    def collect_data(
        self,
        start_date: str,
        end_date: str,
        use_cache: bool = True
    ) -> DataFrame:
        """
        Collect all required data for the specified date range.
        
        Args:
            start_date: Start date in YYYY-MM-DD format
            end_date: End date in YYYY-MM-DD format
            use_cache: Whether to use cached data when available
            
        Returns:
            DataFrame containing collected data
        """
        # Get base game data
        games_df = self.baseball_collector.get_games(start_date, end_date)
        
        # Get comprehensive player statistics
        player_stats = self.baseball_collector.get_player_stats(
            games_df['game_id'].tolist()
        )
        games_df = games_df.merge(player_stats, on='game_id', how='left')
        
        # Add weather data
        tqdm.pandas(desc="Collecting weather data")
        games_df['weather'] = games_df.progress_apply(
            lambda row: self.weather_collector.get_weather(
                row['location'],
                row['game_time'],
                use_cache=use_cache
            ),
            axis=1
        )
        
        # Add betting odds
        tqdm.pandas(desc="Collecting betting odds")
        games_df['odds'] = games_df['game_id'].progress_apply(
            lambda game_id: self.odds_collector.get_odds(
                game_id,
                use_cache=use_cache
            )
        )
        
        return games_df

def main():
    """Command-line interface for data collection."""
    import argparse
    
    parser = argparse.ArgumentParser(
        description='Collect comprehensive baseball game data'
    )
    parser.add_argument('--config', required=True, help='Path to config file')
    parser.add_argument('--start-date', required=True, help='Start date (YYYY-MM-DD)')
    parser.add_argument('--end-date', required=True, help='End date (YYYY-MM-DD)')
    parser.add_argument('--output', required=True, help='Output file path')
    parser.add_argument(
        '--no-cache',
        action='store_true',
        help='Disable use of cached data'
    )
    parser.add_argument(
        '--validate',
        action='store_true',
        help='Validate collected data before saving'
    )
    
    args = parser.parse_args()
    
    try:
        # Validate dates
        validate_dates(args.start_date, args.end_date)
        
        # Initialize collector
        collector = DataCollector(args.config)
        
        # Collect data
        logger.info(f"Starting data collection from {args.start_date} to {args.end_date}")
        data = collector.collect_data(
            args.start_date,
            args.end_date,
            use_cache=not args.no_cache
        )
        
        # Validate if requested
        if args.validate:
            logger.info("Validating collected data")
            validate_collected_data(data)
        
        # Save to file
        output_path = Path(args.output)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        
        if output_path.suffix == '.parquet':
            data.to_parquet(output_path)
        elif output_path.suffix == '.csv':
            data.to_csv(output_path, index=False)
        else:
            raise ValueError("Output file must be .parquet or .csv")
        
        logger.info(f"Data collection complete. Output saved to {args.output}")
        
    except Exception as e:
        logger.error(f"Data collection failed: {e}")
        raise

def validate_dates(start_date: str, end_date: str):
    """
    Validate date format and range.
    
    Args:
        start_date: Start date string in YYYY-MM-DD format
        end_date: End date string in YYYY-MM-DD format
        
    Raises:
        ValueError: If dates are invalid
    """
    try:
        start = datetime.strptime(start_date, '%Y-%m-%d')
        end = datetime.strptime(end_date, '%Y-%m-%d')
        
        if end < start:
            raise ValueError("End date must be after start date")
        
        if end > datetime.now():
            raise ValueError("End date cannot be in the future")
        
        # Limit range to reasonable period
        if (end - start).days > 365:
            raise ValueError("Date range cannot exceed one year")
            
    except ValueError as e:
        raise ValueError(f"Invalid date format: {e}")

def validate_collected_data(data: DataFrame):
    """
    Validate collected data for completeness and consistency.
    
    Args:
        data: DataFrame containing collected data
        
    Raises:
        ValidationError: If validation fails
    """
    # Check required columns
    required_columns = {
        'game_id', 'date', 'home_team', 'away_team',
        'stadium', 'game_time', 'weather', 'odds'
    }
    
    missing_columns = required_columns - set(data.columns)
    if missing_columns:
        raise ValidationError(f"Missing required columns: {missing_columns}")
    
    # Check for missing values in critical columns
    critical_columns = ['game_id', 'date', 'home_team', 'away_team']
    missing_values = data[critical_columns].isnull().sum()
    
    if missing_values.any():
        raise ValidationError(
            f"Missing values in critical columns:\n{missing_values[missing_values > 0]}"
        )
    
    # Validate data types
    expected_types = {
        'game_id': 'object',
        'date': 'datetime64[ns]',
        'home_team': 'object',
        'away_team': 'object'
    }
    
    for column, expected_type in expected_types.items():
        if str(data[column].dtype) != expected_type:
            raise ValidationError(
                f"Invalid type for {column}. Expected {expected_type}, "
                f"got {data[column].dtype}"
            )
    
    # Check for duplicate game IDs
    duplicates = data['game_id'].duplicated()
    if duplicates.any():
        raise ValidationError(
            f"Found {duplicates.sum()} duplicate game IDs"
        )
    
    # Validate weather data
    if 'weather' in data.columns:
        validate_weather_data(data['weather'])
    
    # Validate betting odds
    if 'odds' in data.columns:
        validate_betting_odds(data['odds'])

def validate_weather_data(weather_data: pd.Series):
    """
    Validate weather data structure and values.
    
    Args:
        weather_data: Series containing weather dictionaries
        
    Raises:
        ValidationError: If validation fails
    """
    required_weather_fields = {
        'temperature', 'humidity', 'wind_speed',
        'wind_direction', 'precipitation_probability'
    }
    
    for idx, weather in weather_data.items():
        if weather is None:
            continue
        
        for idx, weather in weather_data.items():
            if not isinstance(weather, dict):
                continue
            
        # Handle nested structure
        weather_values = weather.get('current', weather)
        required_fields = {'temperature', 'humidity', 'wind_speed'}
        
        missing_fields = required_fields - set(weather_values.keys())
        if missing_fields:
            logger.warning(f"Missing weather fields at index {idx}: {missing_fields}")
            continue
            
        missing_fields = required_weather_fields - set(weather.keys())
        if missing_fields:
            raise ValidationError(
                f"Missing weather fields at index {idx}: {missing_fields}"
            )
        
        # Validate value ranges
        if not (-20 <= weather['temperature'] <= 120):
            raise ValidationError(
                f"Invalid temperature at index {idx}: {weather['temperature']}"
            )
        
        if not (0 <= weather['humidity'] <= 100):
            raise ValidationError(
                f"Invalid humidity at index {idx}: {weather['humidity']}"
            )

def validate_betting_odds(odds_data: pd.Series):
    """
    Validate betting odds structure and values.
    
    Args:
        odds_data: Series containing odds dictionaries
        
    Raises:
        ValidationError: If validation fails
    """
    required_odds_fields = {'money_line', 'run_line', 'total'}
    
    for idx, odds in odds_data.items():
        if odds is None:
            continue
            
        # Check each sportsbook's data
        for sportsbook, book_odds in odds.items():
            missing_fields = required_odds_fields - set(book_odds.keys())
            if missing_fields:
                raise ValidationError(
                    f"Missing odds fields for {sportsbook} at index {idx}: "
                    f"{missing_fields}"
                )
            
            # Validate odds values are reasonable
            if book_odds['money_line'] <= 0:
                raise ValidationError(
                    f"Invalid money line odds for {sportsbook} at index {idx}: "
                    f"{book_odds['money_line']}"
                )

if __name__ == "__main__":
    main()



















# # 5. Memory Management for Large Datasets
# def collect_data(self, start_date: str, end_date: str) -> DataFrame:
#     # Add batch processing for large date ranges
#     chunk_size = timedelta(days=30)
#     start = datetime.strptime(start_date, '%Y-%m-%d')
#     end = datetime.strptime(end_date, '%Y-%m-%d')
    
#     all_data = []
#     current_start = start
    
#     while current_start < end:
#         current_end = min(current_start + chunk_size, end)
#         chunk_data = self._collect_data_chunk(
#             current_start.strftime('%Y-%m-%d'),
#             current_end.strftime('%Y-%m-%d')
#         )
#         all_data.append(chunk_data)
#         current_start = current_end + timedelta(days=1)
    
#     return pd.concat(all_data, ignore_index=True)

# ### Data Quality Improvements

# # 1. Add Data Type Validation
# def validate_collected_data(data: DataFrame):
#     # Add dtype validation
#     dtype_checks = {
#         'game_id': str,
#         'date': 'datetime64[ns]',
#         'temperature': float,
#         'humidity': float,
#         'wind_speed': float,
#         'precipitation_probability': float
#     }
    
#     for col, dtype in dtype_checks.items():
#         if col in data.columns:
#             try:
#                 data[col] = data[col].astype(dtype)
#             except Exception as e:
#                 logger.error(f"Data type conversion failed for {col}: {e}")
#                 raise ValueError(f"Invalid data type in column {col}")

# # 2. Add Data Range Validation
# def validate_numerical_ranges(data: DataFrame):
#     range_checks = {
#         'temperature': (-20, 120),
#         'humidity': (0, 100),
#         'wind_speed': (0, 100),
#         'precipitation_probability': (0, 100)
#     }
    
#     for col, (min_val, max_val) in range_checks.items():
#         if col in data.columns:
#             invalid_mask = (data[col] < min_val) | (data[col] > max_val)
#             if invalid_mask.any():
#                 invalid_rows = data[invalid_mask]
#                 logger.warning(f"Found {len(invalid_rows)} rows with invalid {col} values")
#                 # Optionally handle or remove invalid values

# ### Performance Optimizations

# # 1. Implement Parallel Processing
# from concurrent.futures import ThreadPoolExecutor

# def get_player_stats(self, game_ids: List[str]) -> DataFrame:
#     with ThreadPoolExecutor(max_workers=5) as executor:
#         futures = [executor.submit(self._collect_player_stats, game_id) 
#                   for game_id in game_ids]
#         results = [future.result() for future in futures]
    
#     return pd.concat(results, ignore_index=True)

# # 2. Optimize Cache Management
# class DataCache:
#     def __init__(self, cache_dir: Union[str, Path] = 'data', max_age_days: int = 7):
#         self.max_age = timedelta(days=max_age_days)
#         self.cache_dir = Path(cache_dir)
        
#     def clean_old_cache(self):
#         """Remove cache files older than max_age"""
#         current_time = datetime.now()
#         for file_path in self.cache_dir.rglob('*.parquet'):
#             file_age = current_time - datetime.fromtimestamp(file_path.stat().st_mtime)
#             if file_age > self.max_age:
#                 file_path.unlink()