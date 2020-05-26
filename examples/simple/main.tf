terraform {
  required_version = "~> 0.12.0"
}

provider "aws" {
  region              = var.aws_region
  allowed_account_ids = [var.aws_account_id]
  version             = ">= 1.21.0"
}

# Test code
module "this" {
  source = "../../"

  name                    = var.name
  stack                   = var.stack
  detail                  = var.detail
  tags                    = var.tags
  vpc                     = var.vpc
  subnets                 = var.subnets
  source_sg               = var.source_sg
  mysql_version           = var.mysql_version
  mysql_port              = var.mysql_port
  mysql_node_type         = var.mysql_node_type
  mysql_node_size         = var.mysql_node_size
  mysql_master_user       = var.mysql_master_user
  mysql_db                = var.mysql_db
  mysql_snapshot          = var.mysql_snapshot
  mysql_apply_immediately = var.mysql_apply_immediately
  dns_zone                = var.dns_zone
  dns_zone_id             = var.dns_zone_id
}
