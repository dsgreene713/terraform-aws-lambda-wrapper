locals {
  tags = {
    "provisioned-by" = "tfw-aws-lambda"
  }
}

module "lambdas" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 7.4.0"

  for_each = var.functions

  function_name = each.key
  description   = each.value.description
  handler       = each.value.handler
  runtime       = each.value.runtime
  source_path   = each.value.source_path
  artifacts_dir = each.value.artifacts_dir
  store_on_s3   = each.value.store_on_s3
  s3_bucket     = each.value.s3_bucket

  tags = merge(
    each.value.tags,
    local.tags,
    { Name = each.key },
  )
}

module "layers" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 7.4.0"

  for_each = var.layers

  create_layer        = true
  layer_name          = each.key
  description         = each.value.description
  source_path         = each.value.source_path
  artifacts_dir       = each.value.artifacts_dir
  store_on_s3         = each.value.store_on_s3
  s3_bucket           = each.value.s3_bucket
  compatible_runtimes = each.value.compatible_runtimes

  tags = merge(
    each.value.tags,
    local.tags,
    { Name = each.key },
  )
}
