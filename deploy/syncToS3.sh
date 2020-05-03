REGION=us-east-1
CLIENT_STACK=notes-app-client-dev

CLIENT_S3_BUCKET=$(aws cloudformation --region $REGION describe-stacks --stack-name $CLIENT_STACK --query "Stacks[0].Outputs[?OutputKey=='WebAppS3BucketName'].OutputValue" --output text)

aws s3 cp --recursive --acl public-read ./build s3://$CLIENT_S3_BUCKET/
aws s3 cp --acl public-read --cache-control="max-age=0, no-cache, no-store, must-revalidate" ./build/service-worker.js s3://$CLIENT_S3_BUCKET/
aws s3 cp --acl public-read --cache-control="max-age=0, no-cache, no-store, must-revalidate" ./build/index.html s3://$CLIENT_S3_BUCKET/

# CF_DISTRO_ID=$(aws cloudformation --region $REGION describe-stacks --stack-name $CLIENT_STACK --query "Stacks[0].Outputs[?OutputKey=='WebAppCloudFrontDistributionID'].OutputValue" --output text)
# aws cloudfront create-invalidation --distribution-id $CF_DISTRO_ID --paths '/*'