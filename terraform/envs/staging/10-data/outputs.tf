output "db_address" {
  value = module.rds.address
}

output "db_port" {
  value = module.rds.port
}

output "db_name" {
  value = module.rds.db_name
}

output "db_secret_arn" {
  value = module.rds.master_user_secret_arn
}

output "rds_security_group_id" {
  value = module.rds_sg.security_group_id
}