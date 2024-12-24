"""
FRED data pipeline
"""
from __future__ import annotations

import logging

import pendulum

from airflow import DAG
from airflow.decorators import task
from airflow.operators.python import ExternalPythonOperator, PythonVirtualenvOperator

log = logging.getLogger(__name__)



with DAG(
    dag_id="fred_data_pipeline",
    schedule=None,
    start_date=pendulum.datetime(2021, 1, 1, tz="UTC"),
    catchup=False,
    tags=['fred','economic','data','pipeline'],
) as dag:
    
    from .main import run

    @task(task_id="fred_data_pull")
    def fred_data_pull():
        """Pull FRED data, load into database."""
        run()

    fred_data_pull_task = fred_data_pull()

    fred_data_pull_task
