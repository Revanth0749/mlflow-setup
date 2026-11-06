module "mlflow_irsa" {
  source = "git::ssh://git@github.com/Revanth0749/mlflow-setup.git//terraform/modules/irsa-role?ref=main"

  role_name            = "mlflow-${var.environment}-irsa"
  oidc_provider_arn    = data.terraform_remote_state.eks.outputs.oidc_provider_arn
  oidc_provider_url    = data.terraform_remote_state.eks.outputs.oidc_provider_url
  namespace            = "mlflow"
  service_account_name = "mlflow"
  policy_json          = data.aws_iam_policy_document.mlflow_permissions.json
}