### RDS Blueprint

terraform {
  required_version = "~> 1.0"
}

provider "aws" {
  region = var.aws_region
}

### vpc
module "vpc" {
  source  = "Young-ook/ec2/aws//modules/vpc"
  version = "1.0.8"
  name    = var.name
  tags    = var.tags
  vpc_config = {
    azs         = var.azs
    cidr        = "10.10.0.0/16"
    subnet_type = "private"
    single_ngw  = true
  }
}

### rds cluster - amazon aurora
module "rds" {
  source    = "Young-ook/aurora/aws"
  version   = "2.2.1"
  name      = var.name
  tags      = var.tags
  vpc       = module.vpc.vpc.id
  subnets   = slice(values(module.vpc.subnets["private"]), 0, 3)
  cidrs     = [module.vpc.vpc.cidr_block]
  cluster   = var.aurora_cluster
  instances = var.aurora_instances
}

resource "time_sleep" "wait" {
  depends_on      = [module.vpc, module.rds]
  create_duration = "60s"
}

module "proxy" {
  depends_on = [time_sleep.wait]
  source     = "Young-ook/aurora/aws//modules/proxy"
  version    = "2.2.2"
  tags       = var.tags
  subnets    = slice(values(module.vpc.subnets["private"]), 0, 3)
  proxy_config = {
    cluster_id = module.rds.cluster.id
  }
  auth_config = {
    user_name     = module.rds.user.name
    user_password = module.rds.user.password
  }
}

### ec2 cluster - sysbench
module "ec2" {
  source  = "Young-ook/ec2/aws"
  version = "1.0.8"
  name    = var.name
  tags    = var.tags
  subnets = slice(values(module.vpc.subnets["private"]), 0, 3)
  node_groups = [
    {
      name          = "sysbench"
      min_size      = 1
      max_size      = 1
      desired_size  = 1
      instance_type = "m5.large"
      tags          = { purpose = "sysbench" }
    },
  ]
}
