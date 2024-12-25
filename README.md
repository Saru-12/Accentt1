# Employee Information System

A full-stack application for managing employee information using AWS services and React. The system includes a frontend form for employee data entry and a serverless backend for data processing and storage.

## Architecture Overview

```
Frontend (React) → API Gateway → Lambda → DynamoDB
     ↑
   Docker → ECS (Fargate)
```

### Components
- **Frontend**: React application with a form for employee information
- **Backend**: Serverless architecture using AWS services
- **Infrastructure**: Managed with Terraform
- **CI/CD**: Automated with GitHub Actions

## Prerequisites

- Node.js (v14 or later)
- AWS CLI
- Terraform
- Git
- Visual Studio Code
- Docker Desktop for Windows

## Local Development Setup

1. **Clone the Repository**
```powershell
git clone https://github.com/Saru-12/employee-info-system.git
cd employee-info-system
```

2. **Frontend Setup**
```powershell
# Navigate to frontend directory
cd frontend

# Install dependencies
npm install

# Start development server
npm start
```

3. **AWS Configuration**
```powershell
aws configure
```
Enter your:
- AWS Access Key ID
- AWS Secret Access Key
- Default region (e.g., us-east-1)
- Default output format (json)

4. **Terraform Infrastructure**
```powershell
# Navigate to terraform directory
cd terraform

# Initialize Terraform
terraform init

# Review changes
terraform plan

# Apply infrastructure
terraform apply
```

## Project Structure
```
employee-info-system/
├── frontend/
│   ├── src/
│   │   ├── App.js          # Main React component
│   │   └── App.css         # Styles
│   ├── Dockerfile          # Frontend container configuration
│   └── package.json
├── terraform/
│   ├── main.tf             # Main Terraform configuration
│   ├── variables.tf        # Variable definitions
│   └── modules/
│       ├── api_gateway/    # API Gateway configuration
│       ├── dynamodb/       # DynamoDB table configuration
│       ├── ecs/            # ECS/Fargate configuration
│       └── lambda/         # Lambda function configuration
├── lambda/
│   └── employee_handler/   # Lambda function code
└── .github/
    └── workflows/          # GitHub Actions workflows
```

## AWS Services Used

- **Amazon ECS (Fargate)**: Hosts the frontend container
- **API Gateway**: RESTful API endpoint
- **Lambda**: Serverless function for data processing
- **DynamoDB**: NoSQL database for employee information
- **ECR**: Docker image repository

## GitHub Actions Workflow

The CI/CD pipeline automatically:
1. Validates Terraform configurations
2. Deploys AWS infrastructure
3. Builds and pushes Docker images
4. Updates ECS services

## Security Features

- HTTPS enabled on API Gateway
- IAM roles for service access
- Security groups for ECS tasks
- Encrypted data in DynamoDB

## Local Development

1. **Run Frontend Locally**
```powershell
cd frontend
npm start
```

2. **Test Infrastructure Locally**
```powershell
cd terraform
terraform plan
```

## Deployment

1. **Manual Deployment**
```powershell
# Deploy infrastructure
cd terraform
terraform apply

# Build and push frontend
cd ../frontend
docker build -t employee-frontend .
docker push [ECR_REPOSITORY_URL]
```

2. **Automated Deployment**
- Push to main branch
- GitHub Actions will handle deployment

## Environment Variables

Create a `.env` file in the frontend directory:
```
REACT_APP_API_URL=your-api-gateway-url
```

## Monitoring

- CloudWatch Logs for Lambda functions
- CloudWatch Metrics for API Gateway
- ECS Task metrics in CloudWatch

## Troubleshooting

### Common Issues

1. **Terraform Init Fails**
```powershell
# Check AWS credentials
aws sts get-caller-identity

# Clear Terraform cache
Remove-Item -Recurse -Force .terraform/
terraform init
```

2. **Frontend Build Issues**
```powershell
# Clean npm cache
npm cache clean --force
npm install
```

3. **Docker Build Fails**
```powershell
# Reset Docker cache
docker system prune -a
docker build -t employee-frontend . --no-cache
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Push to branch
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, please open an issue in the GitHub repository.
