output "lambda_function_arns" {
  value = { for k, v in module.lambda : k => v.lambda_function_arn }
}