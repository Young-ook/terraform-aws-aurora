aurora_cluster = {
  engine            = "aurora-mysql"
  version           = "5.7.mysql_aurora.2.08.3"
  mode              = "serverless"
  user              = "yourid"
  database          = "yourdb"
  apply_immediately = "false"
}
aurora_instances = []
