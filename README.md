<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.32.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.32.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_iam_workload_identity_pool.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool) | resource |
| [google_iam_workload_identity_pool_provider.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider) | resource |
| [google_project_iam_member.roles](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_member.workload_identity_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [random_id.default](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [google_service_account_iam_policy.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account_iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project"></a> [project](#input\_project) | Unique ID for the Google Cloud Project | `string` | n/a | yes |
| <a name="input_random_id"></a> [random\_id](#input\_random\_id) | Configuration for generating random IDs | `object({ byte_length = number })` | <pre>{<br>  "byte_length": 2<br>}</pre> | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Configuration for the workload service account resource | <pre>object({<br>    account_id   = string<br>    display_name = optional(string)<br>    iam = object({<br>      principal = object({<br>        subject = object({<br>          attribute_value = string<br>        })<br>      })<br>      roles = optional(list(string), [])<br>    })<br>  })</pre> | n/a | yes |
| <a name="input_workload_identity_pool"></a> [workload\_identity\_pool](#input\_workload\_identity\_pool) | Configuration for the Workload Identity Pool resource | <pre>object({<br>    id           = string<br>    display_name = optional(string)<br>    description  = optional(string)<br>    disabled     = optional(bool, false)<br>    project      = optional(string)<br>  })</pre> | n/a | yes |
| <a name="input_workload_identity_pool_provider"></a> [workload\_identity\_pool\_provider](#input\_workload\_identity\_pool\_provider) | Configuration for the Workload Identity Pool Provider resource | <pre>object({<br>    id                  = optional(string, "oidc")<br>    display_name        = optional(string, "OpenID Connect")<br>    description         = optional(string)<br>    disabled            = optional(bool, false)<br>    attribute_mapping   = optional(map(string), {})<br>    attribute_condition = optional(string)<br>    oidc = object({<br>      issuer_uri        = string<br>      allowed_audiences = optional(list(string))<br>      jwks_json         = optional(string)<br>    })<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->