terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# ---------- Storage buckets (same module, used 3 times) ----------

module "raw_bucket" {
  source      = "./modules/data_bucket"
  bucket_name = "${var.project_id}-${var.environment}-raw"
  location    = var.region
  environment = var.environment
}

module "curated_bucket" {
  source      = "./modules/data_bucket"
  bucket_name = "${var.project_id}-${var.environment}-curated"
  location    = var.region
  environment = var.environment
}

module "archive_bucket" {
  source      = "./modules/data_bucket"
  bucket_name = "${var.project_id}-${var.environment}-archive"
  location    = var.region
  environment = var.environment
}

# ---------- BigQuery datasets (same module, used 2 times) ----------

module "raw_dataset" {
  source      = "./modules/bq_dataset"
  dataset_id  = "raw_${var.environment}"
  location    = var.region
  environment = var.environment
}

module "curated_dataset" {
  source      = "./modules/bq_dataset"
  dataset_id  = "curated_${var.environment}"
  location    = var.region
  environment = var.environment
}

# ---------- Pub/Sub topic (no module) ----------

resource "google_pubsub_topic" "sales_events" {
  name = "sales-events-${var.environment}"

  labels = {
    env = var.environment
  }
}

# ---------- Service account (no module) ----------

resource "google_service_account" "etl_runner" {
  account_id   = "etl-runner-${var.environment}"
  display_name = "ETL runner (${var.environment})"
}