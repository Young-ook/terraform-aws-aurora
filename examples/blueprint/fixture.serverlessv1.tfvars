aurora_cluster = {
  engine            = "aurora-mysql"
  mode              = "serverless"
  user              = "yourid"
  database          = "yourdb"
  apply_immediately = "false"
}
aurora_instances = []
