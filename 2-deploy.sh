#!/bin/bash
set -eo pipefail
ARTIFACT_BUCKET=$(cat bucket-name.txt)
cd ../
GOOS=linux go build main.go
cd cf-template/
aws cloudformation package --template-file template.yml --s3-bucket $ARTIFACT_BUCKET --output-template-file out.yml
aws cloudformation deploy --template-file out.yml --stack-name blank-go --capabilities CAPABILITY_NAMED_IAM