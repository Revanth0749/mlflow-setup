variable "name" {
  type        = string
  description = "Name of the security group"
}

variable "description" {
  type        = string
  description = "What the security group is for"
}

variable "vpc_id" {
  type        = string
  description = "VPC the security group belongs to"
}

variable "ingress_rules" {
  type = list(object({
    description              = string
    port                     = number
    protocol                 = optional(string, "tcp")
    source_security_group_id = string
  }))
  description = "Inbound rules, each allowing traffic from other SG"
  default     = []
}

variable "tags" {
  type    = map(string)
  default = {}
}