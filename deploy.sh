#!/bin/bash
BUCKET="front.bucket.295devops.io"
REGION="us-east-1"

bucket_exists() {
    aws s3api head-bucket --bucket $BUCKET 2>/dev/null
}

create_bucket() {
    if ! bucket_exists $BUCKET; then
        echo "Creating bucket $BUCKET"
        aws s3api create-bucket --bucket $BUCKET --region $REGION 
    else
        echo "Bucket $BUCKET already exists"
    fi
}

sync_to_s3 () {
    aws s3 sync . s3://$BUCKET --exclude ".git/*"
    echo "Synced to $BUCKET"
}

create_bucket 
sync_to_s3