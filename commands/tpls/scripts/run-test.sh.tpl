#!/bin/bash
docker run \
	-p 3000:3000 \
	--link airapi-mongo-$ENV:airapi-mongo-$ENV \
	-it $APP_NAME:$IMG_NAME