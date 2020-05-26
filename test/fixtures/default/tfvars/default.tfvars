aws_region      = "ap-northeast-2"
name            = "mysql"
stack           = "dev"
vpc             = "your-vpc"
subnets         = ["your-subnet-1", "your-subnet-2", "your-subnet-3"]
source_sg       = "your-sg"
tags            = { "env" = "dev" }
dns_zone        = "your.private"
dns_zone_id     = "your-hosted-zone"
mysql_version   = "5.7.12"
mysql_node_type = "db.t3.medium"
