import os
import pandas as pd

class Data:
    def __init__(self):     
        cwd = os.getcwd()
        self.train_fname = f'{cwd}/data/train.csv'
        self.test_fname = f'{cwd}/data/test.csv'
    
    def load(self):
        self.train_df = pd.read_csv(self.train_fname)
        self.test_df = pd.read_csv(self.test_fname)
        self.df = pd.concat([self.train_df, self.test_df],axis=0)

        self.index = ['ID_LAT_LON_YEAR_WEEK'] # ,'longitude','latitude','year','week_no']
        self.df = self.df.set_index(self.index)

        self.label = 'emission'
        self.x = self.df.drop(self.label, axis=1)
        self.y = self.df[self.label]