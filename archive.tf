# Install Python requirements
resource "null_resource" "run_install_requirements_script" {
    provisioner "local-exec" {
        command = "cd ${path.module}/src && bash ../script/install_requirements.sh"
    }
}

# Archive file for Lambda function code
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/src/lambda_function.py"
  output_path = "${path.module}/.output/lambda_function.zip"
}

# Archive file for Lambda layer code
data "archive_file" "lambda_layer_zip" {
  type        = "zip"
  source_dir  = "${path.module}/src/packages/"
  output_path = "${path.module}/.output/lambda_layer.zip"

  depends_on = [ null_resource.run_install_requirements_script ]
}
