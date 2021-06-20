#!/usr/bin/env bash
set -euo pipefail

DOMAIN=${1}
PFX=~/certbot/certs/${DOMAIN}.pfx

# PFX
openssl pkcs12 \
    -export \
    -inkey ~/certbot/config/live/${DOMAIN}/privkey.pem \
    -in ~/certbot/config/live/${DOMAIN}/fullchain.pem \
    -out ${PFX} \
    -passout pass:

openssl pkcs12 \
    -info \
    -in ${PFX} \
    -nokeys \
    -passin pass: \
    -passout pass: