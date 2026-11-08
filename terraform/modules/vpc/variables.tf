variable "name" {
  type        = string
  description = "Name prefix for all network resources"
}

variable "cidr" {
  type        = string
  description = "CIDR range for the VPC"
}

variable "azs" {
  type        = list(string)
  description = "Avaliability zones. Subnets will be mapped to these by index"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "One CIDR per AZ for public subnets (ALB, NAT)"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "One CIDR per AZ for private subnets (EKS nodes and pods)"
}

variable "database_subnet_cidrs" {
  type        = list(string)
  description = "One CIDR per AZ for database subnets"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all the resources"
  default     = {}
}
