terraform {
  required_version = "~> 1.0"
}

provider "aws" {
  region = var.aws_region
}

# vpc
module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  version            = "2.78.0"
  name               = var.name
  azs                = var.azs
  cidr               = var.cidrs[0]
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
}

# aurora
module "mysql" {
  source           = "Young-ook/aurora/aws"
  name             = var.name
  tags             = var.tags
  vpc              = module.vpc.vpc_id
  subnets          = module.vpc.private_subnets
  cidrs            = var.cidrs
  aurora_cluster   = var.aurora_cluster
  aurora_instances = var.aurora_instances
}
