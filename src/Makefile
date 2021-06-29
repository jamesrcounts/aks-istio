default: push

registry   := cramplegannet

web:
	bash ../scripts/acr-build.sh $(registry) "content-web"

api: 
	bash ../scripts/acr-build.sh $(registry) "content-api"

init:
	bash ../scripts/acr-build.sh $(registry) "content-init"

push: web api init
