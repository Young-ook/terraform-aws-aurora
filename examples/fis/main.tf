# AWS Fault Injection Simulator

terraform {
  required_version = "~> 1.0"
}

provider "aws" {
  region = var.aws_region
}

# vpc
module "vpc" {
  source              = "Young-ook/spinnaker/aws//modules/spinnaker-aware-aws-vpc"
  name                = var.name
  tags                = var.tags
  azs                 = var.azs
  cidr                = var.cidr
  enable_igw          = true
  enable_ngw          = true
  single_ngw          = true
  vpc_endpoint_config = []
}

# eks
module "eks" {
  source             = "Young-ook/eks/aws"
  name               = var.name
  tags               = var.tags
  subnets            = values(module.vpc.subnets["private"])
  kubernetes_version = var.kubernetes_version
  enable_ssm         = true
  fargate_profiles = [
    {
      name      = "php-apache"
      namespace = "php-apache"
    },
  ]
}

# aurora
module "mysql" {
  source           = "Young-ook/aurora/aws"
  name             = var.name
  tags             = var.tags
  vpc              = module.vpc.vpc.id
  subnets          = values(module.vpc.subnets["private"])
  cidrs            = [var.cidr]
  aurora_cluster   = var.aurora_cluster
  aurora_instances = var.aurora_instances
}
