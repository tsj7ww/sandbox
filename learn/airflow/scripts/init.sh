docker compose down --volumes --remove-orphans
# docker compose down -v
rm -rf logs/* plugins/* dags/__pycache__
docker images | grep airflow-docker
docker rmi $(docker images -q 'airflow-docker*')
mkdir -p ./dags ./logs ./plugins ./config
# docker compose up -d
docker compose up -d --build