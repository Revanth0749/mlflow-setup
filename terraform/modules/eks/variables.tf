variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for the control plane network interfaces and nodes."
}

variable "endpoint_public_access" {
  type        = bool
  description = "Expose the API server publicly (restricted by public_access_cidrs)"
  default     = true
}

variable "public_access_cidrs" {
  type        = list(string)
  description = "CIDRs allowed to reach the public API endpoint"
}

variable "kms_key_arn" {
  type        = string
  description = "KMS key ARN for encrypting Kubernetes secrets."
  default     = null
}

variable "node_instance_types" {
  type        = list(string)
  description = "Instance tyeps for the manahed node group."
  default     = ["t3.medium"]
}

variable "node_min_size" {
  type    = number
  default = 2
}

variable "node_max_size" {
  type    = number
  default = 3
}

variable "node_desired_size" {
  type    = number
  default = 2
}

variable "admin_principal_arns" {
  type        = list(string)
  description = "Extra IAM role/user ARNs given cluster-admin"
  default     = []
}

variable "addons" {
  type        = set(string)
  description = "EKS managed add-ons to install"
  default     = ["vpc-cni", "kube-proxy", "coredns", "eks-pod-identity-agent"]
}

variable "tags" {
  type    = map(string)
  default = {}
}