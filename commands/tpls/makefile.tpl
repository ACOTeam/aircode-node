ENV?=qa
APP_DIR=/var/local/apps/

ifeq ($(ENV),production)
	VERSION:=$(shell git describe --exact-match --tags HEAD)
else
	VERSION:=$(shell git rev-parse --short HEAD)
endif

APP_NAME=airapi-service
SERVICE_TYPE?=api
IMG_NAME=$(ENV)-$(SERVICE_TYPE)-$(VERSION)

deploy:
	echo 'TODO'

build:
	docker build \
	-t $(APP_NAME):$(IMG_NAME) \
	-f ./deploy/Dockerfile.development \
	--build-arg NODE_ENV=$(ENV) \
	--build-arg APP_DIR=$(APP_DIR) .

run:
	docker run \
	-p 3000:3000 \
	-it $(APP_NAME):$(IMG_NAME)
