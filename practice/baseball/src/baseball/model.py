import os
import datetime
import pandas as pd
import numpy as np 
import logging
import sqlite3
import yaml
import json
import pyarrow.parquet as pq

from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import Pipeline
from sklearn.impute import SimpleImputer
# import xgboost as xgb
# import lightgbm as lgb
# import catboost as cb
# import joblib



class Model:
    def __init__(self):
        self.cwd = os.getcwd()
        self.data_dir = f"{self.cwd}/data"
        self.model_dir = f"{self.cwd}/models"
    
    def load_data(self):
        self.df = pd.read_csv(f"{self.data_dir}/data.csv")
    
    def split_data(self):
        self.X = self.df.drop('target', axis=1)
        self.y = self.df['target']
        
        self.X_train, self.X_test, self.y_train, self.y_test = train_test_split(
            self.X, self.y, test_size=0.2, random_state=42
        )

    def train_model(self):
        self.model = RandomForestClassifier()
        self.model.fit(self.X_train, self.y_train)
    
    def evaluate_model(self):
        self.y_pred = self.model.predict(self.X_test)
        self.accuracy = accuracy_score(self.y_test, self.y_pred)
    
    def save_model(self):
        joblib.dump(self.model, f"{self.model_dir}/model.pkl")
    
    def load_model(self):
        self.model = joblib.load(f"{self.model_dir}/model.pkl")
    
    def predict(self, X):
        return self.model.predict(X)
    
    def optimize(self):
        None
        