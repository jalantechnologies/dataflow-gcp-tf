resource "google_storage_bucket" "storage_bucket" {
  name                        = "dataflow_bucket_${var.google_project_id}"
  location                    = "US"
  force_destroy               = true
  uniform_bucket_level_access = true
  storage_class               = "STANDARD"
}
