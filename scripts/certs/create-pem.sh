#!/usr/bin/env bash
set -euo pipefail

DOMAIN=${1}
PEM=~/certbot/certs/${DOMAIN}.pem

# PEM
cat \
    ~/certbot/config/live/${DOMAIN}/fullchain.pem \
    ~/certbot/config/live/${DOMAIN}/privkey.pem \
    > ${PEM}

openssl verify -CAfile ${PEM} ${PEM}