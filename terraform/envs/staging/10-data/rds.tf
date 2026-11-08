module "rds" {
  source = "git::ssh://git@github.com/Revanth0749/mlflow-setup.git//terraform/modules/rds-postgres?ref=main"

  identifier = "mlflow-${var.environment}"

  db_subnet_group_name   = data.terraform_remote_state.network.outputs.db_subnet_group_name
  vpc_security_group_ids = [module.rds_sg.security_group_id]
  kms_key_arn            = data.terraform_remote_state.foundation.outputs.kms_key_arn

  # This is only for Demo purpose. For real use: multi_az = true, deletion_protection = true,
  # skip_final_snapshot = false.
  multi_az            = false
  deletion_protection = false
  skip_final_snapshot = true
}
