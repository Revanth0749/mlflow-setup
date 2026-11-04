module "artifacts_bucket" {
  source = "../../../modules/s3-artifacts"

  bucket_name = "mlflow-${var.environment}-artifacts-${data.aws_caller_identity.current.account_id}"
  kms_key_arn = module.kms.key_arn

  force_destroy = true

  tags = {
    Name = "mlflow-${var.environment}-artifacts"
  }
}