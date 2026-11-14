locals {
  state_bucket = "mlflow-tfstate-840432317544"
  region       = "ap-southeast-2"
}

data "terraform_remote_state" "foundation" {
  backend = "s3"
  config = {
    bucket = local.state_bucket
    key    = "mlflow/staging/00-foundation/terraform.tfstate"
    region = local.region
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = local.state_bucket
    key    = "mlflow/staging/05-network/terraform.tfstate"
    region = local.region
  }
}

data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = local.state_bucket
    key    = "mlflow/staging/07-eks/terraform.tfstate"
    region = local.region
  }
}