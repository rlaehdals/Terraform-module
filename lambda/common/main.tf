locals {
  commons = {
    "common" = "common"
  }
}

resource "aws_lambda_function" "lambda" {
  function_name = var.lambda_name
  architectures = var.architectures

  memory_size  = var.memory_size
  package_type = "Image"
  image_uri    = var.image_uri
  timeout      = var.timeout

  environment {
    variables = merge(var.variables, local.commons)
  }

  vpc_config {
    security_group_ids = []
    subnet_ids         = []
  }

  role = "test"
}