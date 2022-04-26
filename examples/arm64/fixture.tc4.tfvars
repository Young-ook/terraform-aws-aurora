aws_region = "ap-northeast-2"
azs        = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
cidrs      = ["10.0.0.0/16"]
name       = "aurora-arm64-postgresql-tc4"
tags = {
  env     = "dev"
  test    = "tc4"
  version = "11.7"
}
aurora_cluster = {
  engine           = "aurora-postgresql"
  version          = "11.7"
  port             = "5321"
  user             = "yourid"
  database         = "yourdb"
  backup_retention = "5"
}
aurora_instances = [
  {
    instance_type = "db.r6g.4xlarge"
  }
]
