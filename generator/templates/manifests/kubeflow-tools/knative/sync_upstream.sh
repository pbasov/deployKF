#!/usr/bin/env bash

set -euo pipefail

THIS_SCRIPT_PATH=$(cd "$(dirname "$0")" && pwd)
cd "$THIS_SCRIPT_PATH"

# https://github.com/knative/serving/releases/download/knative-v1.13.1/serving-core.yaml
# upstream configs
UPSTREAM_REPO="https://github.com/knative/serving/"
UPSTREAM_VERSION="v1.13.1"
UPSTREAM_RELEASES_PATH="releases/download/knative-${UPSTREAM_VERSION}"


# output configs
OUTPUT_PATH="./upstream"

# clean the generator output directory
rm -rf "$OUTPUT_PATH"

wget -P ${OUTPUT_PATH} ${UPSTREAM_REPO}/${UPSTREAM_RELEASES_PATH}/serving-core.yaml
wget -P ${OUTPUT_PATH} ${UPSTREAM_REPO}/${UPSTREAM_RELEASES_PATH}/serving-crds.yaml
wget -P ${OUTPUT_PATH} ${UPSTREAM_REPO}/${UPSTREAM_RELEASES_PATH}/serving-default-domain.yaml
wget -P ${OUTPUT_PATH} ${UPSTREAM_REPO}/${UPSTREAM_RELEASES_PATH}/serving-hpa.yaml
wget -P ${OUTPUT_PATH} ${UPSTREAM_REPO}/${UPSTREAM_RELEASES_PATH}/serving-post-install-jobs.yaml
wget -P ${OUTPUT_PATH} ${UPSTREAM_REPO}/${UPSTREAM_RELEASES_PATH}/serving-storage-version-migration.yaml