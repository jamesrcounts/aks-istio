default: push

registry   := cramplegannet
repository := container-web

info:
	az acr repository show-tags \
		--name $(registry) \
		--repository $(repository) \
		--orderby time_desc \
		--output table

push:
	az acr build \
		--image $(repository):latest \
		--image $(repository):{{.Run.ID}} \
		--registry $(registry) \
		--file Dockerfile .
