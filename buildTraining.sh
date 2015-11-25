#!/bin/bash

cd docker
docker-compose -f local_platform_temp.yml stop
docker-compose -f local_platform_temp.yml rm
docker-compose -f local_platform_temp.yml build

echo "Done!"
