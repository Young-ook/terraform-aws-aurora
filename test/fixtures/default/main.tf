provider "aws" {
  region = var.aws_region
}

# Test code
module "this" {
  source = "../../../"

  name            = var.name
  stack           = var.stack
  detail          = var.detail
  tags            = var.tags
  vpc             = var.vpc
  subnets         = var.subnets
  source_sg       = var.source_sg
  dns_zone        = var.dns_zone
  dns_zone_id     = var.dns_zone_id
  mysql_version   = var.mysql_version
  mysql_node_type = var.mysql_node_type
}
