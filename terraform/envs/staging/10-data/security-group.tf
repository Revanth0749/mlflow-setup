module "rds_sg" {
  source = "git::ssh://git@github.com/Revanth0749/mlflow-setup.git//terraform/modules/security-group?ref=main"

  name        = "mlflow-${var.environment}-rds"
  description = "Allow PostgreSQL from the EKS nodes only"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id

  ingress_rules = [
    {
      description              = "PostgreSQL form EKS nodes"
      port                     = 5432
      source_security_group_id = data.terraform_remote_state.eks.outputs.cluster_security_group_id
    }
  ]
}