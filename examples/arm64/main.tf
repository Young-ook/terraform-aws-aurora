terraform {
  required_version = "~> 1.0"
}

provider "aws" {
  region = var.aws_region
}

# aurora
module "mysql" {
  source           = "Young-ook/aurora/aws"
  name             = var.name
  tags             = var.tags
  cidrs            = var.cidrs
  aurora_cluster   = var.aurora_cluster
  aurora_instances = var.aurora_instances
}

# sysbench
module "ec2" {
  source  = "Young-ook/ssm/aws"
  version = "0.0.6"
  name    = var.name
  tags    = var.tags
  node_groups = [
    {
      name          = "sysbench"
      min_size      = 1
      max_size      = 1
      desired_size  = 1
      instance_type = "m5.large"
      tags          = { purpose = "sysbench" }
      user_data     = file("${path.cwd}/sysbench-setup.sh")
    },
  ]
}
