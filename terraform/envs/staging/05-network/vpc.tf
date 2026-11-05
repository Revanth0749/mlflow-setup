data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "../../../modules/vpc/"

  name = "mlflow-${var.environment}"
  cidr = "10.0.0.0/16"
  azs  = slice(data.aws_availability_zones.available.names, 0, 2)

  public_subnet_cidrs   = ["10.0.101.0/24", "10.0.102.0/24"]
  private_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  database_subnet_cidrs = ["10.0.201.0/24", "10.0.202.0/24"]

  tags = {
    Region = "ap-southeast-2"
  }
}