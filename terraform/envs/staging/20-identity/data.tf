locals {
  state_bucket = "mlflow-tfstate-181276422093"
  role_arn     = "arn:aws:iam::181276422093:role/tf-deploy-role"
}

data "terraform_remote_state" "foundation" {
  backend = "s3"
  config = {
    bucket      = local.state_bucket
    key         = "mlflow/staging/00-foundation/terraform.tfstate"
    region      = "ap-southeast-2"
    assume_role = { role_arn = local.role_arn }
  }
}

data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket      = local.state_bucket
    key         = "mlflow/staging/07-eks/terraform.tfstate"
    region      = "ap-southeast-2"
    assume_role = { role_arn = local.role_arn }
  }
}

data "aws_iam_policy_document" "mlflow_permissions" {
  statement {
    sid       = "ListBucket"
    actions   = ["s3:ListBucket", "s3:GetBucketLocation"]
    resources = [data.terraform_remote_state.foundation.outputs.artifacts_bucket_arn]
  }

  statement {
    sid       = "ReadWriteArtifacts"
    actions   = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
    resources = ["${data.terraform_remote_state.foundation.outputs.artifacts_bucket_arn}/*"]
  }

  statement {
    sid       = "UseKmsKey"
    actions   = ["kms:Encrypt", "kms:Decrypt", "kms:GenerateDataKey"]
    resources = [data.terraform_remote_state.foundation.outputs.kms_key_arn]
  }
}