#!/bin/bash

set -euo pipefail

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

INFRA_DIR=${SCRIPTS_DIR}/../infra

cd $INFRA_DIR

terraform init \
    -reconfigure \
    -backend-config "region=${AWS_REGION:-ap-southeast-2}" \
    -backend-config "bucket=${STATE_STORE_BUCKET_NAME}"

terraform ${operation} \
    -input=false \
    -auto-approve