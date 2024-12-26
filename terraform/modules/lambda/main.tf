# main_lambda.tf

# Lambda Function for Employee API (Optional)
resource "aws_lambda_function" "lambda_function" {
  function_name = "employeeLambda"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  # Ensure that you have the necessary Lambda code deployment details here.
}

# Output the Lambda Function ARN
output "lambda_function_arn" {
  value       = aws_lambda_function.lambda_function.arn
  description = "The ARN of the Lambda function"
}

# CloudWatch Log Group for Lambda (Optional)
resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name = "/aws/lambda/employeeLambda"
}

# Output the CloudWatch Log Group for Lambda
output "lambda_log_group" {
  value       = aws_cloudwatch_log_group.lambda_log_group.name
  description = "The CloudWatch Log Group associated with the Lambda function"
}
