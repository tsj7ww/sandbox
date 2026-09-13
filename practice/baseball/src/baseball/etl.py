import os
import datetime
import pandas as pd
import numpy as np
import logging
import sqlite3
# from sqlalchemy import create_engine
import yaml
import json
# import pyarrow.parquet as pq



class ETL:
    def __init__(self):
        self.cwd = os.getcwd()
        self.data_dir = f"{self.cwd}/data"
    
    def extract(self):
        None
    
    def transform(self):
        None
    
    def load(self):
        None