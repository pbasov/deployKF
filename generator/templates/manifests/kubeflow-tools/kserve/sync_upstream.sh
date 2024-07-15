#!/usr/bin/env bash

set -euo pipefail

THIS_SCRIPT_PATH=$(cd "$(dirname "$0")" && pwd)
cd "$THIS_SCRIPT_PATH"

# upstream configs
UPSTREAM_REPO="https://github.com/kserve/kserve/"
UPSTREAM_VERSION="v0.13.0"
UPSTREAM_RELEASES_PATH="releases/download/${UPSTREAM_VERSION}"


# output configs
OUTPUT_PATH="./upstream"

# clean the generator output directory
rm -rf "$OUTPUT_PATH"

wget -P ${OUTPUT_PATH} ${UPSTREAM_REPO}/${UPSTREAM_RELEASES_PATH}/kserve.yaml
wget -P ${OUTPUT_PATH} ${UPSTREAM_REPO}/${UPSTREAM_RELEASES_PATH}/kserve-cluster-resources.yaml

# kserve model-web-app
# https://github.com/kubeflow/manifests/blob/master/contrib/kserve/models-web-app/

WEB_APP_REPO="github.com/kubeflow/manifests"
WEB_APP_PATH="contrib/kserve/models-web-app/base"
WEB_APP_REF="a925b2968e68f3085092adc04e9af39d4f5045f3" # v1.8.1

WEB_APP_OUT_PATH="${OUTPUT_PATH}/web-app/"
kustomize localize "${WEB_APP_REPO}/${WEB_APP_PATH}?ref=${WEB_APP_REF}" "$WEB_APP_OUT_PATH"
