default: build

repository := cramplegannet.azurecr.io/container-init:latest

login: 
	az acr login --name cramplegannet

pull:
	docker pull node:alpine

build: pull
	docker build -t $(repository) .

push: build login
	docker push $(repository)
