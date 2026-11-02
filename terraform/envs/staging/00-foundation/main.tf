module "kms" {
  source = "../../../modules/kms"

  alias              = "alias/mlflow-${var.environment}"
  description        = "MLflow ${var.environment}: encrypts artifacts, database, and images"
  key_administrators = ["arn:aws:iam::181276422093:role/tf-deploy-role"]
  tags = {
    Name = "mlflow-${var.environment}"
  }
}