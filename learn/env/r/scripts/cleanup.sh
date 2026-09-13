#!/bin/bash

docker-compose down

docker-compose rm -f -s -v

docker images | grep "rstudio" | awk '{print $3}' | xargs -r docker rmi -f

docker image prune -f

find ./workspace -mindepth 1 ! -name '.gitkeep' -exec rm -rf {} +

find ./r-packages -mindepth 1 ! -name '.gitkeep' -exec rm -rf {} +

docker-compose build --no-cache

docker-compose up -d