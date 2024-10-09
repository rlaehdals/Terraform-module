module "example_1" {
  source = "./common"

  lambda_name = "example-1"
  variables   = []
  image_uri   = "example-1"
}

module "example_2" {
  source = "./common"

  # 반드시 변경되는 부분
  lambda_name = "example_2"
  variables = {
    "example-2" = "example-2"
  }
  image_uri = "example-2"

  # 변경될 수 있는 부분
  architectures  = ["arm64"]
  memory_size    = 1024
  timeout        = 20
  retention_days = 1
}