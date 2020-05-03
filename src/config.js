const region = "us-east-1";

export default {
  MAX_ATTACHMENT_SIZE: 5000000,
  STRIPE_KEY: process.env.REACT_APP_STRIPE_KEY,
  s3: {
    REGION: region,
    BUCKET: process.env.REACT_APP_UPLOADS_BUCKET
  },
  apiGateway: {
    REGION: region,
    URL: process.env.REACT_APP_API_URL
  },
  cognito: {
    REGION: region,
    USER_POOL_ID: process.env.REACT_APP_USER_POOL_ID,
    APP_CLIENT_ID: process.env.REACT_APP_APP_CLIENT_ID,
    IDENTITY_POOL_ID: process.env.REACT_APP_IDENTITY_POOL_ID
  }
};