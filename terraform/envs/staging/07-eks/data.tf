data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "mlflow-tfstate-840432317544"
    key    = "mlflow/staging/05-network/terraform.tfstate"
    region = "ap-southeast-2"
  }
}

data "terraform_remote_state" "foundation" {
  backend = "s3"
  config = {
    bucket = "mlflow-tfstate-840432317544"
    key    = "mlflow/staging/00-foundation/terraform.tfstate"
    region = "ap-southeast-2"
  }
}