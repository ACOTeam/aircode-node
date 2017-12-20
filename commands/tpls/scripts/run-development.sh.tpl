#!/bin/bash
docker run \
	-p 3000:3000 \
	-p 5858:5858 \
	-v $(pwd):$APP_DIR \
	--link airapi-mongo-$ENV:airapi-mongo-$ENV \
	-it $APP_NAME:$IMG_NAME