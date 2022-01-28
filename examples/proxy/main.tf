# Amazon RDS proxy

terraform {
  required_version = "~> 1.0"
}

provider "aws" {
  region = var.aws_region
}

# vpc
module "vpc" {
  source     = "Young-ook/sagemaker/aws//modules/vpc"
  name       = var.name
  tags       = var.tags
  vpc_config = var.vpc_config
}

# aurora
module "mysql" {
  source           = "../../"
  name             = var.name
  tags             = var.tags
  vpc              = module.vpc.vpc.id
  subnets          = values(module.vpc.subnets["private"])
  cidrs            = [var.vpc_config.cidr]
  aurora_cluster   = var.aurora_cluster
  aurora_instances = var.aurora_instances
}

resource "time_sleep" "wait" {
  depends_on      = [module.vpc, module.mysql]
  create_duration = "60s"
}

module "proxy" {
  depends_on = [time_sleep.wait]
  source     = "../../modules/proxy"
  name       = var.name
  tags       = var.tags
  subnets    = values(module.vpc.subnets["private"])
  proxy_config = {
    cluster_id = module.mysql.cluster.id
  }
  auth_config = {
    user_name     = module.mysql.user.name
    user_password = module.mysql.user.password
  }
}
