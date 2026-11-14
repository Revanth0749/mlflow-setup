module "kms" {
  source = "git::ssh://git@github.com/Revanth0749/mlflow-setup.git//terraform/modules/kms?ref=main"

  alias              = "alias/mlflow-${var.environment}"
  description        = "MLflow ${var.environment}: encrypts artifacts, database, and images"
  key_administrators = ["arn:aws:iam::840432317544:role/github-actions-deploy-role"]
  tags = {
    Name = "mlflow-${var.environment}"
  }
}