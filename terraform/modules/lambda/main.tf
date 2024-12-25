resource "aws_iam_role" "lambda_role" {
  name = "employee_lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_lambda_function" "employee_function" {
  filename         = "function.zip"
  function_name    = "employee-handler"
  role            = aws_iam_role.lambda_role.arn
  handler         = "index.handler"
  runtime         = "nodejs16.x"

  environment {
    variables = {
      TABLE_NAME = "EmployeeInfo"
    }
  }
}

output "function_arn" {
  value = aws_lambda_function.employee_function.arn
}

output "function_name" {
  value = aws_lambda_function.employee_function.function_name
}