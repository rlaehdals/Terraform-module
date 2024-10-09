locals {
  commons = {
    "common" = "common"
  }
}

resource "aws_lambda_function" "lambda" {
  function_name = var.lambda_name

  image_uri     = var.image_uri
  architectures = var.architectures
  package_type  = "Image"
  memory_size   = var.memory_size

  role    = "test"
  timeout = var.timeout

  environment {
    variables = merge(var.variables, local.commons)
  }

  tracing_config {
    mode = "Active"
  }

  vpc_config {
    security_group_ids = []
    subnet_ids         = []
  }
}