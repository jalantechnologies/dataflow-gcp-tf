resource "google_service_account" "bq_owner_sa" {
  project    = var.google_project_id
  account_id = "bq-owner-sa"
}
