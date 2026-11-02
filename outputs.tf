output "raw_bucket_name" {
  description = "Name of the raw data bucket"
  value       = module.raw_bucket.name
}

output "curated_bucket_name" {
  description = "Name of the curated data bucket"
  value       = module.curated_bucket.name
}

output "archive_bucket_name" {
  description = "Name of the archive bucket"
  value       = module.archive_bucket.name
}

output "raw_dataset_id" {
  description = "ID of the raw BigQuery dataset"
  value       = module.raw_dataset.dataset_id
}

output "curated_dataset_id" {
  description = "ID of the curated BigQuery dataset"
  value       = module.curated_dataset.dataset_id
}

output "pubsub_topic_name" {
  description = "Name of the sales events topic"
  value       = google_pubsub_topic.sales_events.name
}

output "service_account_email" {
  description = "Email of the ETL runner service account"
  value       = google_service_account.etl_runner.email
}