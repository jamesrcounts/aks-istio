default: build

instance   := cramplegannet
repository := $(instance).azurecr.io/container-api:latest

login: 
	az acr login --name $(instance)

pull:
	docker pull node:alpine

build: pull
	docker build -t $(repository) .

push: build login
	docker push $(repository)
