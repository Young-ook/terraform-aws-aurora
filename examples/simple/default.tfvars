aws_account_id  = "327226472731"
aws_region      = "ap-northeast-2"
name            = "mysql"
stack           = "dev"
subnets         = ["subnet-", "subnet-", "subnet-"]
source_sg       = "sg-1234567abcd"
tags            = { "env" = "dev" }
dns_zone        = "your.private"
dns_zone_id     = "ZSDALSDKSHD"
mysql_version   = "5.7.12"
mysql_node_type = "db.t3.medium"
