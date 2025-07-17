# Lambda layer for required packages
resource "aws_lambda_layer_version" "lambda_layer" {
  filename            = data.archive_file.lambda_layer_zip.output_path
  layer_name         = "web_scraper_dependencies"
  compatible_runtimes = ["python3.13"]
}

# Lambda function
resource "aws_lambda_function" "web_scraper" {
  filename      = data.archive_file.lambda_zip.output_path
  function_name = "web_scraper"
  role          = "arn:aws:iam::663410588581:role/LabRole"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.13"
  timeout       = 30

  layers = [aws_lambda_layer_version.lambda_layer.arn]
}

# Lambda function URL
resource "aws_lambda_function_url" "function_url" {
  function_name      = aws_lambda_function.web_scraper.function_name
  authorization_type = "NONE"
}
