variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region for all resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "environment must be dev or prod."
  }
}