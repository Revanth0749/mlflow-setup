variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "kms_key_arn" {
  description = "KMS key ARN used to encrypt images at rest"
  type        = string
}

variable "image_tag_mutability" {
  description = "IMMUTABLE prevents overwriting an existing tag"
  type        = string
  default     = "IMMUTABLE"

  validation {
    condition     = contains(["IMMUTABLE", "MUTABLE"], var.image_tag_mutability)
    error_message = "image_tag_mutabilitiy must be IMMUTABLE or MUTABLE"
  }
}

variable "scan_on_push" {
  description = "Scan imahes for vulnerabilities when are pushed to the registry"
  type        = bool
  default     = true
}

variable "force_delete" {
  description = "Allow terraform destroy to delete the repository even if it contains images"
  type        = bool
  default     = false
}

variable "untagged_expire_days" {
  description = "Days after which untagged images are deleted"
  type        = number
  default     = 7
}

variable "max_tagged_images" {
  description = "Number of tagged images to keep"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags applied to the repositroy"
  type        = map(string)
  default     = {}
}