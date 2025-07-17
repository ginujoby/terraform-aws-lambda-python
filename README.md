# Deploying a Python Web Scraper on AWS Lambda with Terraform

This project demonstrates how to deploy a Python-based web scraping AWS Lambda function using Terraform, with Python dependencies packaged as a Lambda Layer.

## Overview

- Deploys a Python Lambda function for web scraping tasks.
- Uses a Lambda Layer to manage Python dependencies (from `requirements.txt`).
- Infrastructure is fully managed via Terraform.

## Prerequisites

- AWS Account with necessary permissions
- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [AWS CLI](https://aws.amazon.com/cli/) configured
- Python 3.10 or higher

## Usage

1. **Clone the repository:**
    ```bash
    git clone https://github.com/ginujoby/terraform-aws-lambda-python.git
    cd terraform-aws-lambda-python
    ```

2. **Initialize and apply Terraform:**
    ```bash
    terraform init
    terraform apply
    ```

## License

MIT License.
