resource "google_pubsub_topic" "pubsub_topic" {
  name = "dataflow_topic"
}

resource "google_pubsub_subscription" "pubsub_subscription" {
  name  = "dataflow_subscription"
  topic = google_pubsub_topic.pubsub_topic.name
}
