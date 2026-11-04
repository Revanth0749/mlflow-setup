variable "bucket_name" {
  type        = string
  description = "Gloablly unique buckrt name"
}

variable "kms_key_arn" {
  type        = string
  description = "ARN of the KMS key used for server-side encryption"
}

variable "force_destroy" {
  type        = bool
  description = "Allow terraform destroy to delete the bucket even when it contains objects"
  default     = false
}

variable "nonconcurrent_version_expiration_days" {
  type        = number
  description = "Days to keep old object versions before they are deleted"
  default     = 90
}

variable "abort_incomplete_nultipart_days" {
  type        = number
  description = "Days after which unfinished multipart uploads are cleaned up"
  default     = 7
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the bucket"
  default     = {}
}