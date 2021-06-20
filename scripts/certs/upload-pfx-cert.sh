#!/usr/bin/env bash
set -euo pipefail

DOMAIN=${1}
KV_NAME=${2}
KEY_NAME=$(echo $DOMAIN | tr . -)

az keyvault certificate import \
    --file ${HOME}/certbot/certs/${DOMAIN}.pfx \
    --name ${KEY_NAME} \
    --vault-name ${KV_NAME} 
