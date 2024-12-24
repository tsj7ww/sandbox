# base
import os
import datetime
from math import ceil

# data
import pandas as pd
import numpy as np

# stats
import statsmodels.api as sm
import scipy.stats as stats
from scipy.stats import skew, norm
from sklearn.preprocessing import MinMaxScaler # StandardScaler LabelEncoder RobustScaler MinMaxScaler
from sklearn.experimental import enable_iterative_imputer
from sklearn.impute import IterativeImputer
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import RepeatedStratifiedKFold
from sklearn.feature_selection import RFECV,RFE
from sklearn.ensemble import RandomForestRegressor
# from sklearn.preprocessing import OrdinalEncoder
from sklearn.metrics import mean_squared_error
from sklearn.model_selection import train_test_split

# data viz
import matplotlib.pyplot as plt
import seaborn as sns


class Process:
    def __init__(self,x,y):
        self.x = x
        self.y = y

        self.excl_cols = ['longitude','latitude','year','week_no']
        self.excl = self.x[self.excl_cols]
        self.x = self.x.drop(self.excl_cols,axis=1)

        self.train_idx = self.y.dropna().index
        self.predict_idx = self.y[self.y.isnull()].index
        
        self.index = ['ID_LAT_LON_YEAR_WEEK']
        self.label = 'emission'
    
    def drop(self):
        max_pct_null = 0.3
        nulls = self.x.isnull().sum().to_frame(name='nulls')
        pct_total = pd.concat([nulls,(nulls/self.x.shape[0]).rename({'nulls':'pct_total'},axis=1)],axis=1)
        pct_total.pct_total.sort_values().plot(kind='barh',figsize=(5,10))
        too_many_nulls = pct_total[pct_total.pct_total > max_pct_null].index.tolist()
        print('====== dropping columns ======')
        [print(i) for i in too_many_nulls]
        self.x = self.x.drop(too_many_nulls,axis=1) # drop columns with too many nulls
        print('NitrogenDioxide_cloud_fraction (too many inifinity values)')
        self.x.drop('NitrogenDioxide_cloud_fraction',axis=1,inplace=True)
    
    def cap(self):
        ### make violin plots ###
        cols = 6
        rows = ceil(self.x.shape[1]/cols)
        fig,axes = plt.subplots(rows,cols,figsize=(10,20))
        axes = axes.flatten()
        print('====== pre cap ======')
        for i,col in enumerate(self.x.columns):
            sns.violinplot(data=self.x[col],orient='v',ax=axes[i])
        plt.tight_layout()
        plt.show()

        num_std_devs = 5
        # Loop through columns and cap outliers
        for column_name in self.x.columns:
            # Calculate the mean and standard deviation for the column
            mean = self.x[column_name].mean()
            std_dev = self.x[column_name].std()
            # Define lower and upper bounds for capping
            lower_bound = mean - num_std_devs * std_dev
            upper_bound = mean + num_std_devs * std_dev
            # Cap outliers
            self.x[column_name] = np.where(self.x[column_name] < lower_bound, lower_bound, self.x[column_name])
            self.x[column_name] = np.where(self.x[column_name] > upper_bound, upper_bound, self.x[column_name])
            self.x[column_name] = np.where(self.x[column_name].isin([np.inf,-np.inf]), upper_bound, self.x[column_name])

    def skew(self):
        max_skew = 0.7
        print('====== pre log ======')
        skew = self.x.skew()
        fig,ax = plt.subplots(1,1,figsize=(5,10))
        skew.sort_values().plot(kind='barh',ax=ax)
        high_skew = skew[skew > max_skew].index.tolist()
        [print(i) for i in high_skew]
        for col in high_skew:
            self.x[col] = np.log1p(self.x[col])
        
        print('====== post log ======')
        skew = self.x.skew()
        fig,ax = plt.subplots(1,1,figsize=(5,10))
        skew.sort_values().plot(kind='barh',ax=ax)
        still_high_skew = skew[skew.abs() > max_skew].index.tolist()
        # print('====== dropping columns ======')
        # [print(i) for i in still_high_skew]
        # self.x.drop(still_high_skew,axis=1,inplace=True)

        # transformation
        print('====== label skew (pre vs. post) ======')
        fig, ax = plt.subplots(1,2,figsize=(12,5))
        sm.qqplot(self.y.dropna(), stats.t, distargs=(4,),fit=True, line="45", ax=ax[0])
        sm.qqplot(np.log1p(self.y).dropna(), stats.t, distargs=(4,),fit=True, line="45", ax=ax[1])
        if self.y.skew() > max_skew:
            self.y = np.log1p(self.y)
    
    def scale(self):
        df = pd.concat([self.x,self.excl[['longitude','latitude']]],axis=1)
        scaler = MinMaxScaler() # StandardScaler MinMaxScaler
        scaled = scaler.fit_transform(df.values)
        self.x = pd.DataFrame(scaled,columns=df.columns,index=df.index)
    
    def encode(self):
        None # no categorical features
    
    def fill(self):
        imputer = IterativeImputer(random_state=0)
        imputed = imputer.fit_transform(self.x)
        self.x = pd.DataFrame(imputed, columns=self.x.columns, index=self.x.index)

        if self.x.isnull().values.any():
             print('Missing values!')
        else:
            print('No missing values')
    
    def feature_selection(self,grid=False):
        ### correlation matrix ###

        if grid:
            rfe = RFECV(estimator=RandomForestRegressor(),step=1,cv=5,scoring='neg_mean_squared_error',n_jobs=-1)
        else:
            rfe = RFE(estimator=RandomForestRegressor(),n_features_to_select=60,step=2)
        rfe.fit(self.x.loc[self.train_idx],self.y.loc[self.train_idx])
        self.x = self.x.loc[:,rfe.support_]
    
    def parse(self):
        df = self.excl[['year','week_no','longitude','latitude']]
        df['date'] = df[['year','week_no']].apply(lambda x: datetime.date(int(x.year),1,1)+datetime.timedelta(days=int(x.week_no*7)),axis=1)
        df['month'] = df.date.apply(lambda x: x.month)
        df['location'] = df.apply(lambda x: str(x.longitude)+str(x.latitude),axis=1)

        self.x['date'] = df.date.apply(lambda x: int(x.strftime('%Y%m%d')))
        self.dummies = pd.get_dummies(df[['month','location']],drop_first=False) # prefix='month'
    
    def combine(self):
        self.x = pd.concat([self.x,self.dummies],axis=1)

    def split(self):
        self.y_train = self.y.loc[self.train_idx]
        self.y_predict = self.y.loc[self.predict_idx]

        self.x_train = self.x.loc[self.train_idx]
        self.x_predict = self.x.loc[self.predict_idx]
        
        self.x_train,self.x_test,self.y_train,self.y_test = train_test_split(
            self.x_train,self.y_train,test_size=0.2,random_state=42
        )