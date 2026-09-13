import os
import datetime 



class Portfolio:
    def __init__(self, matchup_dt):
        self.matchup_dt = matchup_dt

        with open(f"data/matchups/{matchup_dt.replace('-','')}.txt") as f:
            self.matchups_raw = f.read()
        self._process_matchups()

    def _process_matchups(self):
        self.matchups = [
            {
                'away': i.split(' @ ')[0], 
                'home': i.split(' @ ')[1]
            }
            for i in self.matchups_raw.split('\n')
        ]
    
    def get_odds(self):
        None

    def optimize(self):
        None