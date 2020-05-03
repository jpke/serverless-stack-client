UPLOADS_STACK=notes-app-ext-uploads-dev
API_STACK=notes-app-api-dev
AUTH_STACK=notes-app-ext-auth-dev

REACT_APP_UPLOADS_BUCKET=$(aws cloudformation --region us-east-1 describe-stacks --stack-name $UPLOADS_STACK --query "Stacks[0].Outputs[?OutputKey=='AttachmentsBucketName'].OutputValue" --output text)
REACT_APP_API_URL=$(aws cloudformation --region us-east-1 describe-stacks --stack-name $API_STACK --query "Stacks[0].Outputs[?OutputKey=='ServiceEndpoint'].OutputValue" --output text)
REACT_APP_USER_POOL_ID=$(aws cloudformation --region us-east-1 describe-stacks --stack-name $AUTH_STACK --query "Stacks[0].Outputs[?OutputKey=='UserPoolId'].OutputValue" --output text)
REACT_APP_APP_CLIENT_ID=$(aws cloudformation --region us-east-1 describe-stacks --stack-name $AUTH_STACK --query "Stacks[0].Outputs[?OutputKey=='UserPoolClientId'].OutputValue" --output text)
REACT_APP_IDENTITY_POOL_ID=$(aws cloudformation --region us-east-1 describe-stacks --stack-name $AUTH_STACK --query "Stacks[0].Outputs[?OutputKey=='IdentityPoolId'].OutputValue" --output text)

cat > .env << EOF
REACT_APP_STRIPE_KEY=pk_test_waddpcpCY8C52r4LsaFklsaJ00KykJfoVe
REACT_APP_UPLOADS_BUCKET=$REACT_APP_UPLOADS_BUCKET
REACT_APP_API_URL=$REACT_APP_API_URL
REACT_APP_USER_POOL_ID=$REACT_APP_USER_POOL_ID
REACT_APP_APP_CLIENT_ID=$REACT_APP_APP_CLIENT_ID
REACT_APP_IDENTITY_POOL_ID=$REACT_APP_IDENTITY_POOL_ID
EOF