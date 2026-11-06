locals {
  state_bucket = "mlflow-tfstate-181276422093"
  role_arn     = "arn:aws:iam::181276422093:role/tf-deploy-role"
  region       = "ap-southeast-2"
}

data "terraform_remote_state" "foundation" {
  backend = "s3"
  config = {
    bucket = local.state_bucket
    key    = "mlflow/staging/00-foundation/terraform.tfstate"
    region = local.region
    assume_role = {
      role_arn = local.role_arn
    }
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = local.state_bucket
    key    = "mlflow/staging/05-network/terraform.tfstate"
    region = local.region
    assume_role = {
      role_arn = local.role_arn
    }
  }
}

data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = local.state_bucket
    key    = "mlflow/staging/07-eks/terraform.tfstate"
    region = local.region
    assume_role = {
      role_arn = local.role_arn
    }
  }
}