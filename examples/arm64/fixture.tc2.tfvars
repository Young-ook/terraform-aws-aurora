aws_region = "ap-northeast-2"
azs        = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
cidrs      = "10.0.0.0/16"
name       = "aurora-arm64-mysql-tc2"
tags = {
  env     = "dev"
  test    = "tc2"
  version = "aurora.3.01.0"
}
aurora_cluster = {
  engine            = "aurora-mysql"
  version           = "8.0.mysql_aurora.3.01.0"
  port              = "3309"
  user              = "yourid"
  database          = "yourdb"
  backup_retention  = "1"
  apply_immediately = "false"
  cluster_parameters = {
    character_set_server = "utf8"
    character_set_client = "utf8"
  }
}
aurora_instances = [
  {
    instance_type = "db.r6g.xlarge"
  }
]
