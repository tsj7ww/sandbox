FROM apache/airflow:${AIRFLOW_VERSION:-2.8.1}-python${PYTHON_VERSION:-3.11}

# Switch to root to create directory with correct permissions
USER root
WORKDIR /
RUN mkdir -p /requirements && chown -R airflow:root /requirements

# Switch back to airflow user for pip install
USER airflow
COPY --chown=airflow:root requirements.txt /requirements/requirements.txt
RUN pip install --no-cache-dir -r /requirements/requirements.txt

WORKDIR /opt/airflow