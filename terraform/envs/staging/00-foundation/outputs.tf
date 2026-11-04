output "kms_key_arn" {
  value = module.kms.key_arn
}

output "key_alias_name" {
  value = module.kms.alias_name
}

output "artifacts_bucket_name" {
  value = module.artifacts_bucket.bucket_name
}

output "artifacts_bucket_arn" {
  value = module.artifacts_bucket.bucket_arn
}
output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "ecr_repository_arn" {
  value = module.ecr.repository_arn
}