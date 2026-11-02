variable "bucket_name" {
  description = "Globally unique name of the bucket"
  type        = string
}

variable "location" {
  description = "Region where the bucket lives"
  type        = string
}

variable "environment" {
  description = "dev or prod, stored as a label"
  type        = string
}