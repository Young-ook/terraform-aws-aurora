aws_region = "ap-northeast-2"
azs        = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
cidrs      = ["10.0.0.0/16"]
name       = "aurora-mysql-tc5-serverless"
tags = {
  test               = "tc5"
  scaling            = "customized"
  serverless_version = "v1"
}
aurora_cluster = {
  engine            = "aurora-mysql"
  mode              = "serverless"
  user              = "yourid"
  database          = "yourdb"
  apply_immediately = "false"
}
aurora_instances = []
