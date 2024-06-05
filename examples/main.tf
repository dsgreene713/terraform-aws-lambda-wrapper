provider "aws" {
  region                      = "us-east-1"
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true
}

locals {
  base_source_path = "${path.root}/src"
  artifacts_dir    = "${path.root}/.terraform/lambda-builds/"

  lambdas = {
    test1 = {
      description   = "this is test1"
      handler       = "main.lambda_handler"
      source_path   = "${local.base_source_path}/test1"
      artifacts_dir = local.artifacts_dir
      runtime       = "python3.12"
    }
    test2 = {
      description   = "this is test2"
      handler       = "main.lambda_handler"
      source_path   = "${local.base_source_path}/test2"
      artifacts_dir = local.artifacts_dir
      runtime       = "python3.11"
    }
  }
}

module "lambdas" {
  source    = "../"
  functions = local.lambdas
}

output "arns" {
  value = module.lambdas.lambda_function_arns
}