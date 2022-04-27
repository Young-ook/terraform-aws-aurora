aws_region = "ap-northeast-2"
azs        = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
cidr       = "10.0.0.0/16"
name       = "aurora-arm64-postgresql-tc3"
tags = {
  env     = "dev"
  test    = "tc3"
  version = "11.7"
}
aurora_cluster = {
  engine            = "aurora-postgresql"
  version           = "11.7"
  port              = "5431"
  user              = "yourid"
  database          = "yourdb"
  backup_retention  = "1"
  apply_immediately = "false"
}
aurora_instances = [
  {
    instance_type = "db.r6g.xlarge"
  }
]
