## aws partition and region (global, gov, china)
data "aws_partition" "current" {}

## default vpc
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

# security/firewall
resource "aws_security_group" "db" {
  count       = local.enabled ? 1 : 0
  name        = format("%s", var.name)
  description = format("security group for %s", var.name)
  vpc_id      = var.vpc
  tags        = merge(local.default-tags, var.tags)

  ingress {
    from_port   = lookup(var.aurora_cluster, "port", local.default_cluster["port"])
    to_port     = lookup(var.aurora_cluster, "port", local.default_cluster["port"])
    protocol    = "tcp"
    cidr_blocks = var.cidrs
    self        = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
