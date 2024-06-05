locals {
  tags = {
    "provisioned-by" = "tfw-aws-lambda"
  }
}

module "lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 7.4.0"

  for_each = var.functions

  function_name = each.key
  description   = each.value.description
  handler       = each.value.handler
  runtime       = each.value.runtime
  source_path   = each.value.source_path
  artifacts_dir = each.value.artifacts_dir

  tags = merge(
    each.value.tags,
    local.tags,
    { Name = each.key },
  )
}
