variable "google_project_id" {
  #  default = ""
}

variable "google_project_region" {
  default = "us-central1"
}

provider "google" {
  project     = var.google_project_id
  credentials = "${path.module}/secrets/credentials.json"
  region      = var.google_project_region
}
