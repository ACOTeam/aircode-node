ENV?=development
APP_DIR=/var/local/apps/

ifeq ($(ENV),production)
	VERSION:=$(shell git describe --exact-match --tags HEAD)
else
	VERSION:=$(shell git rev-parse --short HEAD)
endif

APP_NAME:=airapi-service
SERVICE_TYPE?=api
IMG_NAME:=$(ENV)-$(SERVICE_TYPE)-$(VERSION)
BASE_IMG_NAME:=$(APP_NAME)-base:1.0.0

run_mongo:
	ENV=$(ENV) sh ./deploy/scripts/run-mongo.sh

deploy:
	echo 'TODO'

build_base:
	TAG=$(BASE_IMG_NAME) sh ./deploy/scripts/build-base.sh

build:
	docker build \
		-t $(APP_NAME):$(IMG_NAME) \
		-f ./deploy/Dockerfile.$(ENV) \
		--build-arg APP_DIR=$(APP_DIR) .

run: run_mongo
	APP_NAME=$(APP_NAME) IMG_NAME=$(IMG_NAME) APP_DIR=$(APP_DIR) ENV=$(ENV) sh ./deploy/scripts/run-$(ENV).sh

up: build run

.PHONY: deploy build build_base run run_mongo up