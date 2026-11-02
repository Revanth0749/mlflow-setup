terraform {
  backend "s3" {
    bucket       = "mlflow-tfstate-181276422093"
    key          = "mlflow/staging/00-foundation/terraform.tfstate"
    region       = "ap-southeast-2"
    use_lockfile = true

    assume_role = {
      role_arn = "arn:aws:iam::181276422093:role/tf-deploy-role"
    }
  }
}