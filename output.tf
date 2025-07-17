# Output the function URL
output "lambda_function_url" {
  value = aws_lambda_function_url.function_url.function_url
}
