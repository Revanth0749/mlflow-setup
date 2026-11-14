terraform {
  backend "s3" {
    bucket       = "mlflow-tfstate-840432317544 "
    key          = "mlflow/staging/00-foundation/terraform.tfstate"
    region       = "ap-southeast-2"
    use_lockfile = true

    assume_role = {
      role_arn = "arn:aws:iam::840432317544:role/github-actions-deploy-role"
    }
  }
}
