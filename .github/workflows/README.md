# CI/CD Pipeline Setup

This directory contains GitHub Actions workflow configurations for continuous integration and deployment of the Online Shop application.

## CI/CD Pipeline

The CI/CD pipeline performs the following steps:

1. **Build and Test**:
   - Checks out the code
   - Sets up Node.js environment
   - Installs dependencies
   - Runs linting
   - Builds the application
   - Uploads build artifacts
   - Sends email notification on failure

2. **Deploy** (only on main/master branch):
   - Downloads build artifacts
   - Configures AWS credentials
   - Logs in to Amazon ECR
   - Builds and pushes Docker image
   - Deploys to AWS S3 and invalidates CloudFront cache
   - Sends success notification email

## Required Secrets

To use this workflow, you need to set up the following secrets in your GitHub repository:

### AWS Credentials
- `AWS_ACCESS_KEY_ID`: Your AWS access key
- `AWS_SECRET_ACCESS_KEY`: Your AWS secret key
- `AWS_REGION`: The AWS region (e.g., us-east-1)
- `S3_BUCKET`: The S3 bucket name for deployment
- `CLOUDFRONT_DISTRIBUTION_ID`: Your CloudFront distribution ID

### Email Notification Settings
- `MAIL_SERVER`: SMTP server address
- `MAIL_PORT`: SMTP server port
- `MAIL_USERNAME`: SMTP username
- `MAIL_PASSWORD`: SMTP password
- `NOTIFICATION_EMAIL`: Email address to receive notifications

## How to Use

The pipeline will automatically run on:
- Push to main/master branch
- Pull requests to main/master branch
- Manual trigger via GitHub Actions UI