#!/usr/bin/env bash

set -euo pipefail

THIS_SCRIPT_PATH=$(cd "$(dirname "$0")" && pwd)
cd "$THIS_SCRIPT_PATH"

# upstream configs
UPSTREAM_REPO="https://github.com/knative/serving/"
UPSTREAM_VERSION="v1.13.1"
UPSTREAM_RELEASES_PATH="releases/download/knative-${UPSTREAM_VERSION}"

UPSTREAM_ISTIO_REPO="https://github.com/knative/net-istio/"
UPSTREAM_ISTIO_RELEASES_PATH="releases/download/knative-${UPSTREAM_VERSION}"

# output configs
OUTPUT_PATH="./upstream"

# clean the generator output directory
rm -rf "$OUTPUT_PATH"

wget -P ${OUTPUT_PATH} ${UPSTREAM_REPO}/${UPSTREAM_RELEASES_PATH}/serving-core.yaml
wget -P ${OUTPUT_PATH} ${UPSTREAM_ISTIO_REPO}/${UPSTREAM_ISTIO_RELEASES_PATH}/net-istio.yaml