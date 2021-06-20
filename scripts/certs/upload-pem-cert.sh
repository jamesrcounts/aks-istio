#!/usr/bin/env bash
set -euo pipefail

DOMAIN=${1}
KV_NAME=${2}
KEY_NAME=$(echo $DOMAIN | tr . -)

CERT=~/certbot/config/live/${DOMAIN}/fullchain.pem
CHAIN=~/certbot/config/live/${DOMAIN}/chain.pem
KEY=~/certbot/config/live/${DOMAIN}/privkey.pem

az keyvault secret set \
    --file ${CERT} \
    --name "${KEY_NAME}-cert" \
    --vault-name ${KV_NAME}

az keyvault secret set \
    --file ${CHAIN} \
    --name "${KEY_NAME}-ca" \
    --vault-name ${KV_NAME}

az keyvault secret set \
    --file ${KEY} \
    --name "${KEY_NAME}-key" \
    --vault-name ${KV_NAME}