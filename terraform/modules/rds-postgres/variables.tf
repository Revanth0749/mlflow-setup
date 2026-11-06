variable "identifier" {
  type        = string
  description = "Name of the RDS Instance"
}

variable "engine_version" {
  type        = string
  description = "PostgreSQL version"
  default     = "16"
}

variable "parameter_group_family" {
  type        = string
  description = "Must match the major version, for example postgres16."
  default     = "postgres16"
}

variable "instance_class" {
  type    = string
  default = "db.t4g.micro"
}

variable "allocated_storage" {
  type        = number
  description = "Initial storage in GB."
  default     = 20
}

variable "max_allocated_storage" {
  type        = number
  description = "Storage autoscaling ceiling in GB."
  default     = 50
}

variable "db_name" {
  type    = string
  default = "mlflow"
}

variable "master_username" {
  type    = string
  default = "mlflow_admin"
}

variable "db_subnet_group_name" {
  type        = string
  description = "Subnet group made of database subnets."
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Security groups attached to the instance."
}

variable "kms_key_arn" {
  type        = string
  description = "KMS key for storage encryption and the managed master password."
}

variable "multi_az" {
  type    = bool
  default = false
}

variable "backup_retention_period" {
  type        = number
  description = "Days to keep automated backups."
  default     = 7
}

variable "deletion_protection" {
  type    = bool
  default = false
}

variable "skip_final_snapshot" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}