#!/usr/bin/env bash
set -euo pipefail

DOMAIN=${1}

# Debug info
certbot --version

# Get certificates using Route53 for validation
certbot certonly \
    --logs-dir ~/certbot/log \
    --config-dir ~/certbot/config \
    --work-dir ~/certbot/work \
    --dns-route53 \
    -d ${DOMAIN}