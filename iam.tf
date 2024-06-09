resource "google_service_account" "default" {
  # Required arguments
  account_id = "${var.service_account.account_id}-${random_id.default.hex}"

  # Optional arguments
  display_name = var.service_account.display_name
}

resource "google_project_iam_member" "roles" {
  # Meta arguments
  for_each = toset(
    concat(var.service_account.iam.roles, ["iam.serviceAccountUser"])
  )

  # Required arguments
  project = var.project
  role    = "roles/${each.key}"
  member  = "serviceAccount:${google_service_account.default.email}"

  # Optional arguments
  # Nothing to do here...
}

resource "google_service_account_iam_member" "workload_identity_user" {
  # Required arguments
  service_account_id = google_service_account.default.id
  member             = "principal://iam.googleapis.com/${google_iam_workload_identity_pool.default.name}/subject/${var.service_account.iam.principal.subject.attribute_value}"
  role               = "roles/iam.workloadIdentityUser"

  # Optional arguments
  # Nothing to do here...
}

data "google_service_account_iam_policy" "default" {
  # Meta arguments
  depends_on = [
    google_project_iam_member.roles,
    google_service_account_iam_member.workload_identity_user
  ]

  # Required arguments
  service_account_id = google_service_account.default.id
  # Optional arguments
  # Nothing to do here...
}
