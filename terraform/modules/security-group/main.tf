resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  tags = merge(var.tags, { Name = var.name })

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  for_each = { for rule in var.ingress_rules : rule.description => rule }

  security_group_id            = aws_security_group.this.id
  description                  = each.value.description
  from_port                    = each.value.port
  to_port                      = each.value.port
  ip_protocol                  = each.value.protocol
  referenced_security_group_id = each.value.source_security_group_id
}