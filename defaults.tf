### default variables

locals {
  default_mysql_cluster = {
    engine              = "aurora-mysql"
    mode                = "provisioned"
    family              = "aurora-mysql5.7"
    version             = "5.7.mysql_aurora.2.07.1"
    port                = "3306"
    database            = "yourdb"
    user                = "yourid"
    iam_auth_enabled    = false
    skip_final_snapshot = true
    snapshot_id         = null
    backup_retention    = 7
    apply_immediately   = false
    cluster_parameters  = {}
    scaling = {
      auto_pause               = true
      max_capacity             = 128
      min_capacity             = 1
      seconds_until_auto_pause = 300
      timeout_action           = "ForceApplyCapacityChange"
    }
  }
  default_mysql_instances = [
    {
      instance_type       = "db.t3.medium"
      instance_parameters = {}
    }
  ]

  default_postgresql_cluster = {
    engine              = "aurora-postgresql"
    mode                = "provisioned"
    family              = "aurora-postgresql11"
    version             = "11.7"
    port                = "5432"
    database            = "yourdb"
    user                = "yourid"
    iam_auth_enabled    = false
    skip_final_snapshot = true
    snapshot_id         = null
    backup_retention    = 7
    apply_immediately   = false
    cluster_parameters  = {}
    scaling = {
      auto_pause               = true
      max_capacity             = 128
      min_capacity             = 1
      seconds_until_auto_pause = 300
      timeout_action           = "ForceApplyCapacityChange"
    }
  }
  default_postgresql_instances = [
    {
      instance_type       = "db.t3.medium"
      instance_parameters = {}
    }
  ]
}
