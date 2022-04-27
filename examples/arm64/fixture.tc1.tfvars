aws_region = "ap-northeast-2"
azs        = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
cidr       = "10.0.0.0/16"
name       = "aurora-arm64-mysql-tc1"
tags = {
  env     = "dev"
  test    = "tc1"
  version = "aurora.2.09.2"
}
aurora_cluster = {
  engine            = "aurora-mysql"
  version           = "5.7.mysql_aurora.2.09.2"
  port              = "3308"
  user              = "yourid"
  database          = "yourdb"
  backup_retention  = "5"
  apply_immediately = "false"
  cluster_parameters = {
    character_set_server = "utf8"
    character_set_client = "utf8"
  }
}
aurora_instances = [
  {
    instance_type = "db.r6g.large"
    instance_parameters = {
      autocommit = 0
    }
  }
]
