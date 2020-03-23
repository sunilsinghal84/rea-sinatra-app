#!/bin/bash

set -euo pipefail

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export STATE_STORE_BUCKET_NAME="rea-sinatra-app-state-store"
${SCRIPTS_DIR}/create-state-storage-bucket.sh

operation=destroy ${SCRIPTS_DIR}/run-terraform.sh