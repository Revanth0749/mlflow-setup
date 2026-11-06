resource "aws_db_parameter_group" "this" {
  name_prefix = var.identifier
  family      = var.parameter_group_family
  description = "MLflow PostgreSQL parameters"

  parameter {
    name  = "rds.force_ssl"
    value = "1"
  }

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_db_instance" "this" {
  identifier = var.identifier

  engine         = "postgress"
  engine_version = var.engine_version
  instance_class = var.instance_class

  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_type          = "gp3"
  storage_encrypted     = true
  kms_key_id            = var.kms_key_arn

  db_name  = var.db_name
  username = var.master_username

  manage_master_user_password   = true
  master_user_secret_kms_key_id = var.kms_key_arn

  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids
  parameter_group_name   = aws_db_parameter_group.this.name
  publicly_accessible    = false

  multi_az                = var.multi_az
  backup_retention_period = var.backup_retention_period

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

  auto_minor_version_upgrade = true
  deletion_protection        = var.deletion_protection
  skip_final_snapshot        = var.skip_final_snapshot
  copy_tags_to_snapshot      = true

  tags = merge(var.tags, { Name = var.identifier })
}