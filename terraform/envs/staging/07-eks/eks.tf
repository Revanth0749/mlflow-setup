module "eks" {
  source = "git::ssh://git@github.com/Revanth0749/mlflow-setup.git//terraform/modules/eks?ref=main"

  cluster_name    = "mlflow-${var.environment}"
  cluster_version = "1.31"

  subnet_ids           = data.terraform_remote_state.network.outputs.private_subnet_ids
  public_access_cidrs  = ["157.50.88.23/32"]
  kms_key_arn          = data.terraform_remote_state.foundation.outputs.kms_key_arn
  admin_principal_arns = []
}