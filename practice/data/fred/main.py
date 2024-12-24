from .fred import Fred
from .database import Database

import logging
log = logging.getLogger(__name__)

import os
import time
import random
import pandas as pd

def run():
    api_key = os.environ['FRED_API_KEY'] = 'b85eb30e34abc01edd5b64c248bb945b'
    fred = Fred(api_key)
    db = Database('economic')
    random_time = random.uniform(0.5, 1.5)

    topics = [
        'gdp','cpi',
        'm2','earnings',
        'unemployment',#'unemployment rate',
        'employment',#'employment rate',
        'consumption',
        'inflation',
    ]
    limit = 100


    for topic in topics:
        tables = fred.search(topic,limit=limit,order_by='popularity',sort_order='asc')
        tables.to_sql(f'fred_{topic}_tbls',db.engine,schema='base',if_exists='replace',index=False)

        base_df = pd.DataFrame(None,columns=['metric','data_dt','metric_id'])
        base_df.to_sql(f'fred_{topic}_data',db.engine,schema='base',if_exists='replace',index=False)
        
        for i in range(tables.shape[0]):
            df = pd.DataFrame(fred.get_series(tables.iloc[i]['id']),columns=['metric'])
            df = df.reset_index(drop=False).rename(columns={'index': 'data_dt'})
            df = df.assign(metric_id=table['id'])
            df.to_sql(f'fred_{topic}_data',db.engine,schema='base',if_exists='append',index=False)
            
            time.sleep(random_time)

    db.close()