aws_region      = "ap-northeast-2"
azs             = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
name            = "mysql"
stack           = "dev"
source_sg       = "sg-1234567abcd"
tags            = { "env" = "dev" }
dns_zone        = "your.private"
dns_zone_id     = "ZSDALSDKSHD"
mysql_version   = "5.7.12"
mysql_node_type = "db.t3.medium"
