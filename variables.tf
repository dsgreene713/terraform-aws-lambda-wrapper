######################################################################################
# required variables
######################################################################################
variable "functions" {
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

######################################################################################
# optional variables
######################################################################################
