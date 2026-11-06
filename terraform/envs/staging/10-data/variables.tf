variable "region" {
  type        = string
  description = "AWS region"
}

variable "role_arn" {
  type        = string
  description = "AWS role assigned for terraform user"
}

variable "environment" {
  type        = string
  description = "MLFlow environment"
}