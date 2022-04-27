terraform {
  required_version = "~> 1.0"
}

provider "aws" {
  region = var.aws_region
}

# vpc
module "vpc" {
  source  = "Young-ook/vpc/aws"
  version = "1.0.1"
  name    = var.name
  tags    = var.tags
  vpc_config = {
    cidr        = var.cidr
    azs         = var.azs
    single_ngw  = true
    subnet_type = "private"
  }
}

# aurora
module "mysql" {
  source           = "Young-ook/aurora/aws"
  name             = var.name
  tags             = var.tags
  cidrs            = [var.cidr]
  vpc              = module.vpc.vpc.id
  subnets          = values(module.vpc.subnets["private"])
  aurora_cluster   = var.aurora_cluster
  aurora_instances = var.aurora_instances
}

# sysbench
module "ec2" {
  source  = "Young-ook/ssm/aws"
  version = "0.0.7"
  name    = var.name
  tags    = var.tags
  subnets = values(module.vpc.subnets["private"])
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
