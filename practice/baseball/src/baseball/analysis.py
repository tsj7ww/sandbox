import os 
import pandas as pd
import numpy as np 
import logging
import pyarrow.parquet as pq

import matplotlib.pyplot as plt
import seaborn as sns
from plotly import express as px
from plotly import graph_objects as go

class Analysis:
    def __init__(self):
        self.cwd = os.getcwd()
        self.data_dir = f"{self.cwd}/data"
        self.analysis_dir = f"{self.cwd}/analysis"
    
    def load_data(self):
        self.df = pd.read_csv(f"{self.data_dir}/data.csv")
    
    def plot_corr(self):
        corr = self.df.corr()
        plt.figure(figsize=(12, 10))
        sns.heatmap(corr, annot=True, cmap='coolwarm')
        plt.savefig(f"{self.analysis_dir}/corr.png")
    
    def plot_dist(self):
        for col in self.df.columns:
            plt.figure(figsize=(12, 10))
            sns.distplot(self.df[col])
            plt.savefig(f"{self.analysis_dir}/{col}_dist.png")
    
    def plot_scatter(self):
        for col in self.df.columns:
            plt.figure(figsize=(12, 10))
            sns.scatterplot(x=col, y='target', data=self.df)
            plt.savefig(f"{self.analysis_dir}/{col}_scatter.png")
    
    def plot_feature_importance(self):
        pass
        