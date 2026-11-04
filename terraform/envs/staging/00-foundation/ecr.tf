module "ecr" {
  source          = "../../../modules/ecr/"
  repository_name = "mlflow"
  kms_key_arn     = module.kms.key_arn

  force_delete = true

  tags = {
    Name = "mlflow-${var.environment}"
  }
}