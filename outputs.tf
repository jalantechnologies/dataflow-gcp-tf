output "google_project_id" {
  value = var.google_project_id
}

output "google_project_region" {
  value = var.google_project_region
}

output "google_storage_name" {
  value = google_storage_bucket.storage_bucket.name
}

output "google_pubsub_topic_id" {
  value = google_pubsub_topic.pubsub_topic.id
}

output "google_pubsub_subscription_id" {
  value = google_pubsub_subscription.pubsub_subscription.id
}

output "google_bigquery_dataset_id" {
  value = google_bigquery_dataset.bq_dataset.dataset_id
}

output "google_bigquery_table_id" {
  value = google_bigquery_table.bq_table.table_id
}
