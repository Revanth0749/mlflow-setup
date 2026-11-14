output "cluster_security_group_id" {
  description = "Security group attached to the EKS cluster."
  value       = module.eks.cluster_security_group_id
}

output "oidc_provider_arn" {
  description = "ARN of the EKS cluster's OIDC provider."
  value       = module.eks.oidc_provider_arn
}

output "oidc_provider_url" {
  description = "Issuer URL of the EKS cluster's OIDC provider."
  value       = module.eks.oidc_provider_url
}
