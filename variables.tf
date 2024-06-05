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
    tags          = optional(map(string), {})
  }))
}

######################################################################################
# optional variables
######################################################################################
