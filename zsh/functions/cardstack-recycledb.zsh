#!/bin/sh

PORT=$1

CONTAINER_ID=`docker ps | grep "$PORT->5432" | cut -d " " -f 1`

docker kill $CONTAINER_ID
docker run -d -p $PORT:5432 --rm cardstack/pg-test
