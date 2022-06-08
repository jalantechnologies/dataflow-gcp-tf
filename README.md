# Dataflow GCP

This teraform repository sets up a Dataflow pipeline for inserting data into BigQuery via publishing messages on PubSub.

## Requirements

- Terraform
- Docker
- `gcloud` CLI (for testing)

## Steps

- Create new project on GCP. Note down the project id.
- From IAM - Create new service account. This account will be responsible for provisioning resources
  via this terraform repo. Grant access to following roles:
    - Pub/Sub Subscriber
    - BigQuery Data Editor
    - Storage Admin
    - Service Account User
    - Dataflow Admin
    - Create Service Accounts
    - Pub/Sub Editor
- Download and store credentials in JSON format for the service account. Rename file to "credentials.json" and add it to "secrets" directory on the
  root of this repo.
- Enable following APIs for the project:
    - Identity and Access Management (IAM) API
    - Cloud Pub/Sub API
    - Cloud Resource Manager API
    - Dataflow API

- Run `terraform init`
- Create file `terraform.tfvars` in root of this repo. Provide values:

```terraform
google_project_id = "<your project id here>"
```

- Run `terraform apply`. Wait for the process to complete. Note down the outputs.

- Using Docker, run the following:

```shell
docker build -t dataflow_pubsub:latest lib/dataflow

docker run --mount "type=bind,source=${PWD}/secrets,target=/app/secrets" dataflow_pubsub:latest python pipeline.py --streaming \
    --runner DataflowRunner \
    --project <google_project_id> \
    --region <google_project_region> \
    --temp_location gs://<google_storage_name>/tmp_dir \
    --job_name dataflow-pubsub-job \
    --max_num_workers 2 \
    --pubsub_subscription <google_pubsub_subscription_id> \
    --output_table <google_project_id>:<google_bigquery_dataset_id>.<google_bigquery_table_id>
```

- For testing, publish following message. Entry should be added in BigQuery by the dataflow pipeline.

```shell
gcloud pubsub topics publish <google_pubsub_topic_id> --message='{"title": "Hi!", "message": "Could you please look at that thing?"}'
```

- Docker process can now be interrupted. Dataflow job won't be affected by this action. Job can be still manually managed from the console.

## Demo

https://user-images.githubusercontent.com/23015711/172703129-e7377169-f7b5-4040-a235-b62681ee2b3a.mov
