output "workload_identity_pool_id" {
  description = "Workload Identity Pool ID (including random suffix)."
  value       = google_iam_workload_identity_pool.default.workload_identity_pool_id
}

output "workload_identity_pool_name" {
  description = "Full resource name of the Workload Identity Pool (projects/{project}/locations/global/workloadIdentityPools/{pool_id})."
  value       = google_iam_workload_identity_pool.default.name
}

output "workload_identity_pool_provider_id" {
  description = "Workload Identity Pool Provider ID."
  value       = google_iam_workload_identity_pool_provider.default.workload_identity_pool_provider_id
}

output "workload_identity_pool_provider_name" {
  description = "Full resource name of the Workload Identity Pool Provider (used by GitHub Actions google-github-actions/auth as workload_identity_provider)."
  value       = google_iam_workload_identity_pool_provider.default.name
}

output "service_account_id" {
  description = "Service account resource ID (projects/{project}/serviceAccounts/{email})."
  value       = google_service_account.default.id
}

output "service_account_email" {
  description = "Service account email address (used by GitHub Actions google-github-actions/auth as service_account)."
  value       = google_service_account.default.email
}

output "service_account_unique_id" {
  description = "Service account unique numeric ID."
  value       = google_service_account.default.unique_id
}
