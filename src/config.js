const region = "us-east-1";

export default {
  MAX_ATTACHMENT_SIZE: 5000000,
  STRIPE_KEY: "pk_test_waddpcpCY8C52r4LsaFklsaJ00KykJfoVe",
  s3: {
    REGION: region,
    BUCKET: "jp-east-1-serverless-tutorial"
  },
  apiGateway: {
    REGION: region,
    URL: "https://ve6yk4j6x0.execute-api.us-east-1.amazonaws.com/prod"
  },
  cognito: {
    REGION: region,
    USER_POOL_ID: "us-east-1_TSBlBspbj",
    APP_CLIENT_ID: "1chai72anfr4aj2etadmh97jjm",
    IDENTITY_POOL_ID: "us-east-1:53a1ea41-7a48-4a76-9103-d353b21ace47"
  }
};