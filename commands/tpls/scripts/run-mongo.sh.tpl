#!/bin/bash
if [ "$(docker ps --filter "name=airapi-mongo-$ENV" -q)" ]; then
  docker rm -f $(docker ps --filter name=airapi-mongo -q)
fi
docker run -p 27017:27017 --name airapi-mongo-$ENV -d mongo