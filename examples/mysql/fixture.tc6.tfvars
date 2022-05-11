aws_region = "ap-northeast-2"
azs        = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
cidrs      = ["10.0.0.0/16"]
name       = "aurora-mysql-tc6-serverlessv2"
tags = {
  test               = "tc6"
  scaling            = "customized"
  serverless_version = "v2"
}
aurora_cluster = {
  engine            = "aurora-mysql"
  family            = "aurora-mysql8.0"
  version           = "8.0.mysql_aurora.3.02.0"
  mode              = "provisioned"
  user              = "yourid"
  database          = "yourdb"
  apply_immediately = "false"
  scaling_v2 = {
    max_capacity = 128.0
    min_capacity = 0.5
  }
}
aurora_instances = [
  {
    instance_type = "db.serverless"
  },
]
