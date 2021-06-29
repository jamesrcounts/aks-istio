#!/usr/bin/env bash
set -euox pipefail

REGISTRY=${1}
REPOSITORY=${2}

az acr build \
    --image ${REPOSITORY}:latest \
    --image ${REPOSITORY}:{{.Run.ID}} \
    --registry ${REGISTRY} \
    --file ./${REPOSITORY}/Dockerfile \
    ./${REPOSITORY}