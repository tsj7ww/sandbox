# Baseball Game Prediction and Betting Optimization System


- [RetroSheet (play by play)](https://www.retrosheet.org/)
- [Baseball Reference (stats)](https://www.baseball-reference.com/)
- [Lahman's Database](http://seanlahman.com/)
- [Fangraphs](https://www.fangraphs.com/)
- [BaseballSavant](https://baseballsavant.mlb.com/)





---

## Project Overview

This system predicts baseball game outcomes and optimizes betting strategies using machine learning. It combines historical MLB data, weather patterns, betting market dynamics, and team/player statistics to create a comprehensive prediction and portfolio optimization framework.

## 1. Data Collection

The system integrates three primary data sources to build a complete picture of each game:

### Baseball Statistics
We collect historical game data, team statistics, and player performance metrics from Baseball Reference and FanGraphs APIs. This includes batting, pitching, and fielding statistics, as well as advanced metrics like WAR and Win Probability. The data collection process handles rate limiting and implements robust error handling:

```python
def collect_game_stats(game_id):
    """Collects comprehensive game statistics with exponential backoff."""
    session = create_rate_limited_session()
    game_data = {
        'basic_stats': collect_basic_stats(session, game_id),
        'advanced_metrics': collect_advanced_metrics(session, game_id),
        'player_stats': collect_player_stats(session, game_id)
    }
    return process_and_validate_stats(game_data)
```

### Weather Data
Weather conditions significantly impact game outcomes. We collect temperature, humidity, wind speed/direction, and precipitation probability for each game. The system maintains multiple weather data sources for redundancy:

```python
def get_game_weather(location, game_time):
    """Collects weather data with fallback sources."""
    try:
        return primary_weather_api.get_conditions(location, game_time)
    except APIError:
        return backup_weather_source.get_conditions(location, game_time)
```

### Betting Market Data
We track odds movements across major sportsbooks to capture market sentiment and identify valuable betting opportunities. The system stores both opening and closing lines, along with significant line movements.

## 2. Data Preprocessing

Data preprocessing focuses on creating meaningful features that capture team performance, matchup dynamics, and external factors. The process involves several key steps:

### Feature Engineering
We generate features that represent recent performance, head-to-head matchups, and contextual factors. For example, calculating team performance metrics:

```python
def calculate_team_metrics(team_data, window_sizes=[7, 14, 30]):
    """Creates rolling performance metrics for different timeframes."""
    metrics = {}
    for window in window_sizes:
        metrics[f'rolling_{window}d'] = {
            'runs_scored': team_data['runs'].rolling(window).mean(),
            'era': calculate_rolling_era(team_data, window),
            'win_pct': calculate_rolling_winpct(team_data, window)
        }
    return metrics
```

### Data Cleaning
The system handles missing values, normalizes statistics across different ballparks, and accounts for roster changes and injuries. Data validation ensures consistency and quality throughout the pipeline.

## 3. Modeling

Our modeling approach combines multiple machine learning algorithms to capture different aspects of game prediction:

### Model Architecture
The system uses an ensemble of models:
- Gradient boosting (XGBoost/LightGBM) for handling nonlinear relationships
- Neural networks for capturing complex patterns
- Logistic regression as a robust baseline

The ensemble weights are dynamically adjusted based on recent performance:

```python
def create_weighted_ensemble():
    """Creates an ensemble with dynamic weighting."""
    return {
        'xgboost': XGBClassifier(n_estimators=1000, learning_rate=0.01),
        'lightgbm': LGBMClassifier(n_estimators=1000, learning_rate=0.01),
        'neural_net': create_neural_network(),
        'logistic': LogisticRegression(C=1.0)
    }
```

### Training Strategy
We employ time-based cross-validation to prevent data leakage and ensure our models capture temporal patterns. Regular retraining incorporates the latest data while maintaining model stability.

## 4. Portfolio Optimization

The portfolio optimization component balances expected returns with risk management:

### Kelly Criterion
We implement a modified Kelly Criterion that accounts for model uncertainty and correlation between games:

```python
def calculate_bet_size(probability, odds, bankroll, risk_factor=0.5):
    """Calculates optimal bet size using fractional Kelly."""
    kelly_fraction = ((odds * probability - 1) / (odds - 1))
    return kelly_fraction * risk_factor * bankroll
```

### Risk Management
The system implements several risk control measures:
- Maximum exposure limits per game and daily total
- Correlation analysis between concurrent games
- Dynamic bankroll management based on recent performance

## Setup and Usage

1. Install dependencies:
```bash
pip install -r requirements.txt
```

2. Configure API keys in `config.yaml`:
```yaml
baseball_reference:
  api_key: YOUR_KEY
weather:
  primary_key: YOUR_KEY
  backup_key: YOUR_KEY
```

3. Run the pipeline:
```bash
python run_pipeline.py --start-date 2024-01-01 --end-date 2024-12-31
```

## Future Improvements

- Incorporate player injury impact analysis
- Add sentiment analysis from social media
- Implement real-time odds monitoring
- Develop automated betting execution

For more detailed implementation guidance or to contribute, please contact the development team.