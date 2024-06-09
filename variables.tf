variable "project" {
  type        = string
  description = "Unique ID for the Google Cloud Project"
}

variable "workload_identity_pool" {
  type = object({
    id           = string
    display_name = optional(string)
    description  = optional(string)
    disabled     = optional(bool, false)
    project      = optional(string)
  })
  description = "Configuration for the Workload Identity Pool resource"
}

variable "workload_identity_pool_provider" {
  type = object({
    id                  = optional(string, "oidc")
    display_name        = optional(string, "OpenID Connect")
    description         = optional(string)
    disabled            = optional(bool, false)
    attribute_mapping   = optional(map(string))
    attribute_condition = optional(string)
    oidc = object({
      issuer_uri        = string
      allowed_audiences = optional(list(string))
      jwks_json         = optional(string)
    })
  })
  description = "Configuration for the Workload Identity Pool Provider resource"
}

variable "service_account" {
  type = object({
    account_id   = string
    display_name = optional(string)
    iam = object({
      principal = object({
        subject = object({
          attribute_value = string
        })
      })
      roles = optional(list(string), [])
    })
  })
  description = "Configuration for the workload service account resource"
}

variable "random_id" {
  type        = object({ byte_length = number })
  description = "Configuration for generating random IDs"
  default     = { byte_length = 2 }
}
