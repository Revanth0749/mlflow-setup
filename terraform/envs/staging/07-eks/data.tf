data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "mlflow-tfstate-181276422093"
    key    = "mlflow/staging/05-network/terraform.tfstate"
    region = "ap-southeast-2"
    assume_role = {
      role_arn = "arn:aws:iam::181276422093:role/tf-deploy-role"
    }
  }
}

data "terraform_remote_state" "foundation" {
  backend = "s3"
  config = {
    bucket = "mlflow-tfstate-181276422093"
    key    = "mlflow/staging/00-foundation/terraform.tfstate"
    region = "ap-southeast-2"
    assume_role = {
      role_arn = "arn:aws:iam::181276422093:role/tf-deploy-role"
    }
  }
}