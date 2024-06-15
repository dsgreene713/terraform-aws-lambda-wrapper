######################################################################################
# required variables
######################################################################################
variable "functions" {
  type = map(object({
    // functions
    description   = optional(string)
    handler       = string
    runtime       = string
    source_path   = string
    artifacts_dir = optional(string, "lambda-builds")
    store_on_s3   = optional(bool, false)
    s3_bucket     = optional(string)

    // layers
    create_layer        = optional(bool, false)
    layer_name          = optional(string)
    compatible_runtimes = optional(list(string))

    // shared
    tags = optional(map(string), {})
  }))
}

######################################################################################
# optional variables
######################################################################################
