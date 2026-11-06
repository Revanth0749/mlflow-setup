module "ecr" {
  source          = "git::ssh://git@github.com/Revanth0749/mlflow-setup.git//terraform/modules/ecr?ref=main"
  repository_name = "mlflow"
  kms_key_arn     = module.kms.key_arn

  force_delete = true

  tags = {
    Name = "mlflow-${var.environment}"
  }
}