######################################################################################
# required variables
######################################################################################


######################################################################################
# optional variables
######################################################################################
variable "functions" {
  description = "lambda configuration"
  default     = {}

  type = map(object({
    description   = optional(string)
    handler       = string
    runtime       = string
    source_path   = string
    artifacts_dir = optional(string, "lambda-builds")
    store_on_s3   = optional(bool, false)
    s3_bucket     = optional(string)
    tags          = optional(map(string), {})
  }))
}

variable "layers" {
  description = "layer configuration"
  default     = {}

  type = map(object({
    description         = optional(string)
    source_path         = string
    artifacts_dir       = optional(string, "layer-builds")
    store_on_s3         = optional(bool, false)
    s3_bucket           = optional(string)
    layer_name          = optional(string)
    compatible_runtimes = optional(list(string))
    tags                = optional(map(string), {})
  }))
}