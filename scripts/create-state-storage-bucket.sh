#!/bin/bash

set -euo pipefail

function main() {
    if bucketAlreadyExists; then
        echo "Bucket $STATE_STORE_BUCKET_NAME already exists, not creating it again."
    else
        echo "Bucket $STATE_STORE_BUCKET_NAME does not exist. Creating it..."
        createBucket
    fi
    configureBucket
    echo "Done!"
}

function bucketAlreadyExists() {
    echo "Checking if bucket $STATE_STORE_BUCKET_NAME already exists..."
    if aws s3api head-bucket --bucket "$STATE_STORE_BUCKET_NAME" 2>/dev/null; then
      return 0
    else
      return 1
    fi
}

function createBucket() {
    aws s3api create-bucket \
        --bucket "$STATE_STORE_BUCKET_NAME" \
        --region "${AWS_REGION:-ap-southeast-2}" \
        --create-bucket-configuration "LocationConstraint=${AWS_REGION:-ap-southeast-2}" \
        --acl private
}

function configureBucket() {
    echo "Ensuring versioning is enabled for bucket..."
    aws s3api put-bucket-versioning \
        --bucket "$STATE_STORE_BUCKET_NAME" \
        --versioning-configuration Status=Enabled

    echo "Ensuring encryption is enabled for bucket..."
    aws s3api put-bucket-encryption \
        --bucket "$STATE_STORE_BUCKET_NAME" \
        --server-side-encryption-configuration "{
                \"Rules\": [
                    {
                        \"ApplyServerSideEncryptionByDefault\": {
                            \"SSEAlgorithm\": \"aws:kms\",
                            \"KMSMasterKeyID\": \"alias/rea-sinatra-app-kms-key\"
                        }
                    }
                ]
            }"
}

main