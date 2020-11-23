terraform {
  required_version = "0.13.5"
}

provider "aws" {
  region              = var.aws_region
  allowed_account_ids = [var.aws_account_id]
}

# vpc
module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  version            = "2.63.0"
  name               = var.name
  azs                = var.azs
  cidr               = "10.0.0.0/16"
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
}

# aurora
module "mysql" {
  source            = "../../"
  name              = var.name
  stack             = var.stack
  detail            = var.detail
  tags              = var.tags
  vpc               = module.vpc.vpc_id
  subnets           = module.vpc.private_subnets
  source_sg         = var.source_sg
  mysql_version     = var.mysql_version
  mysql_port        = var.mysql_port
  mysql_node_type   = var.mysql_node_type
  mysql_node_count  = var.mysql_node_count
  mysql_master_user = var.mysql_master_user
  mysql_db          = var.mysql_db
  mysql_snapshot    = var.mysql_snapshot
  apply_immediately = var.apply_immediately
  dns_zone          = var.dns_zone
  dns_zone_id       = var.dns_zone_id
}
