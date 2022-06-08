resource "google_bigquery_dataset" "bq_dataset" {
  dataset_id                  = "dataflow_dataset"
  default_table_expiration_ms = 3600000
}

resource "google_bigquery_table" "bq_table" {
  dataset_id = google_bigquery_dataset.bq_dataset.dataset_id
  table_id   = "dataflow_table"

  time_partitioning {
    type = "DAY"
  }

  schema = <<EOF
[
  {
    "name": "title",
    "type": "STRING",
    "description": "Message title"
  },
  {
    "name": "message",
    "type": "STRING",
    "description": "Message body"
  },
  {
    "name": "timestamp",
    "type": "TIMESTAMP",
    "description": "Message arrival time"
  }
]
EOF
}
