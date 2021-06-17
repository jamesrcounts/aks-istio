#!/usr/bin/env bash
set -euo pipefail

curl -sL https://istio.io/downloadIstioctl | sh -
mv ${HOME}/.istioctl/bin/istioctl /usr/local/bin