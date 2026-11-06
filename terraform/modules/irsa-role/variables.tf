variable "role_name" {
  type        = string
  description = "Name of the IAM role."
}

variable "oidc_provider_arn" {
  type        = string
  description = "ARN of the EKS OIDC provider."
}

variable "oidc_provider_url" {
  type        = string
  description = "OIDC issuer URL WITHOUT https://."
}

variable "namespace" {
  type        = string
  description = "Kubernetes namespace of the ServiceAccount."
}

variable "service_account_name" {
  type        = string
  description = "Name of the Kubernetes ServiceAccount."
}

variable "policy_json" {
  type        = string
  description = "JSON of the permissions policy attached to the role."
}

variable "tags" {
  type    = map(string)
  default = {}
}