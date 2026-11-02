variable "dataset_id" {
  description = "BigQuery dataset ID (letters, numbers and underscores only)"
  type        = string
}

variable "location" {
  description = "Region where the dataset lives"
  type        = string
}

variable "environment" {
  description = "dev or prod, stored as a label"
  type        = string
}