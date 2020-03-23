#!/bin/bash

set -euo pipefail

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export STATE_STORE_BUCKET_NAME="rea-sinatra-app-state-store"
${SCRIPTS_DIR}/create-state-storage-bucket.sh

operation=apply ${SCRIPTS_DIR}/run-terraform.sh

cd ${SCRIPTS_DIR}/../infra

WEBSITE_URL=$(terraform output website_url)

while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' $WEBSITE_URL)" != "200" ]]; 
do 
    echo "Please wait, your website is coming up and will soon be available....."
    sleep 5; 
done

echo "Hurray!!!, Your website is up and running now, thanks for your patience"
echo -e "Please use '\033[1m$WEBSITE_URL\033[0m' to access the application"