resource "google_iam_workload_identity_pool" "default" {
  # Required arguments
  workload_identity_pool_id = "${var.workload_identity_pool.id}-${random_id.default.hex}"
  # Optional argumnets
  display_name = var.workload_identity_pool.display_name
  disabled     = var.workload_identity_pool.disabled
}

resource "google_iam_workload_identity_pool_provider" "default" {
  # Required arguments
  workload_identity_pool_provider_id = var.workload_identity_pool_provider.id
  workload_identity_pool_id          = google_iam_workload_identity_pool.default.workload_identity_pool_id
  # Optional arguments
  display_name = var.workload_identity_pool_provider.display_name
  description  = var.workload_identity_pool_provider.description
  disabled     = var.workload_identity_pool_provider.disabled
  attribute_mapping = merge(
    { "google.subject" = "assertion.sub" },
    coalesce(var.workload_identity_pool_provider.attribute_mapping, {}),
  )
  attribute_condition = var.workload_identity_pool_provider.attribute_condition
  oidc {
    issuer_uri        = var.workload_identity_pool_provider.oidc.issuer_uri
    allowed_audiences = var.workload_identity_pool_provider.oidc.allowed_audiences
    jwks_json         = var.workload_identity_pool_provider.oidc.jwks_json
  }
}
