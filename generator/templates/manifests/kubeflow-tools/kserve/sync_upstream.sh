#!/usr/bin/env bash

set -euo pipefail

THIS_SCRIPT_PATH=$(cd "$(dirname "$0")" && pwd)
cd "$THIS_SCRIPT_PATH"

# upstream configs
UPSTREAM_REPO="https://github.com/kserve/kserve/"
UPSTREAM_VERSION="v0.12.1"
UPSTREAM_RELEASES_PATH="releases/download/${UPSTREAM_VERSION}"


# output configs
OUTPUT_PATH="./upstream"

# clean the generator output directory
rm -rf "$OUTPUT_PATH"

wget -P ${OUTPUT_PATH} ${UPSTREAM_REPO}/${UPSTREAM_RELEASES_PATH}/kserve.yaml
wget -P ${OUTPUT_PATH} ${UPSTREAM_REPO}/${UPSTREAM_RELEASES_PATH}/kserve-cluster-resources.yaml