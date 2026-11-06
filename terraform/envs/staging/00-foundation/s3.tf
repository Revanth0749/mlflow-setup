module "artifacts_bucket" {
  source = "git::ssh://git@github.com/Revanth0749/mlflow-setup.git//terraform/modules/s3-artifacts?ref=main"

  bucket_name = "mlflow-${var.environment}-artifacts-${data.aws_caller_identity.current.account_id}"
  kms_key_arn = module.kms.key_arn

  force_destroy = true

  tags = {
    Name = "mlflow-${var.environment}-artifacts"
  }
}