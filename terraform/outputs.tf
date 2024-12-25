# Output the API Gateway URL
output "api_gateway_url" {
  value = aws_api_gateway_rest_api.api_gateway.invoke_url
  description = "The URL of the deployed API Gateway"
}

# Output the DynamoDB Table Name
output "dynamodb_table_name" {
  value = aws_dynamodb_table.dynamodb_table.name
  description = "The name of the DynamoDB table"
}

# Output the ECS Cluster Name
output "ecs_cluster_name" {
  value = aws_ecs_cluster.ecs_cluster.name
  description = "The name of the ECS cluster"
}

# Output the ECS Service ARN
output "ecs_service_arn" {
  value = aws_ecs_service.ecs_service.arn
  description = "The ARN of the ECS service"
}

# Output the Lambda Function ARN
output "lambda_function_arn" {
  value = aws_lambda_function.lambda_function.arn
  description = "The ARN of the Lambda function"
}

# Output the ECR repository URI
output "ecr_repository_uri" {
  value = aws_ecr_repository.employee_frontend.repository_url
  description = "The URI of the ECR repository"
}

# Output the ECS Task Definition ARN
output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.ecs_task_definition.arn
  description = "The ARN of the ECS task definition"
}

# Output the Lambda function name
output "lambda_function_name" {
  value = aws_lambda_function.lambda_function.function_name
  description = "The name of the Lambda function"
}

# Output the CloudWatch Log Group for Lambda
output "lambda_log_group" {
  value = aws_cloudwatch_log_group.lambda_log_group.name
  description = "The CloudWatch Log Group associated with the Lambda function"
}
