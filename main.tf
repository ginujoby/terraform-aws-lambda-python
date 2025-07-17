terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.2.0"
    }
  }
}

# Provider configuration
provider "aws" {
  region = var.aws_region
}

# IAM role for Lambda
# resource "aws_iam_role" "lambda_role" {
#   name = "web_scraper_lambda_role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Principal = {
#           Service = "lambda.amazonaws.com"
#         }
#       }
#     ]
#   })
# }

# IAM policy for Lambda
# resource "aws_iam_role_policy" "lambda_policy" {
#   name = "web_scraper_lambda_policy"
#   role = aws_iam_role.lambda_role.id

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "logs:CreateLogGroup",
#           "logs:CreateLogStream", 
#           "logs:PutLogEvents"
#         ]
#         Resource = "arn:aws:logs:*:*:*"
#       }
#     ]
#   })
# }

# IAM policy for CloudWatch Logs
# resource "aws_iam_role_policy_attachment" "lambda_logs" {
#   role       = aws_iam_role.lambda_role.name
#   policy_arn = aws_iam_role_policy.lambda_policy.arn
# }

