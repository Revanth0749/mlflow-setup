output "kms_key_arn" {
  value = module.kms.key_arn
}

output "key_alias_name" {
  value = module.kms.alias_name
}