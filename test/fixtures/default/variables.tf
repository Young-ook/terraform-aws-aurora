# [DO NOT REMOVE] Variables for testing framework
variable "aws_region" {
  description = "The AWS region name for the VPC (e.g. ap-northeast-2)"
  type        = string
  default     = "ap-northeast-2"
}

variable "build_num" {
  description = "The build number of CI"
  type        = string
  default     = "1"
}

# Variables for providing to module fixture codes

### network
variable "vpc" {
  description = "The vpc id to deploy"
}

variable "subnets" {
  description = "The list of subnet ids to deploy"
  type        = list
}

variable "source_sg" {
  description = "The id of source security group to allow incoming traffic to access db"
}

### rdb cluster (aurora-mysql)
variable "mysql_version" {
  description = "The target version of mysql cluster"
  default     = "5.7.12"
}

variable "mysql_port" {
  description = "The port number of mysql"
  default     = "3306"
}

variable "mysql_node_type" {
  description = "The instance type for mysql cluster"
  default     = "db.r4.large"
}

variable "mysql_node_count" {
  description = "The instance count for mysql (aurora) cluster"
  default     = "1"
}

variable "mysql_master_user" {
  description = "The name of master user of mysql"
  default     = "yourid"
}

variable "mysql_db" {
  description = "The name of initial database in mysql"
  default     = "yourdb"
}

#  [CAUTION] Changing the snapshot will force a new resource.

variable "mysql_snapshot" {
  description = "The name of snapshot to be source of new mysql cluster"
  default     = ""
}

variable "mysql_cluster_parameters" {
  description = " A dict of DB parameters to apply. Note that parameters may differ from a family to an other."
  default     = {}
}

variable "apply_immediately" {
  description = "pecifies whether any database modifications are applied immediately, or during the next maintenance window"
  default     = false
}

### tags
variable "tags" {
  description = "The key-value maps for tagging"
  type        = map
}

### description
variable "name" {
  description = "The logical name"
  default     = "mysql"
}

variable "detail" {
  description = "The extra description"
  default     = ""
}

variable "stack" {
  description = "Text used to identify stack of infrastructure components"
  default     = "default"
}

### dns
variable "dns_zone" {
  description = "The hosted zone name for internal dns, e.g., app.internal"
}

variable "dns_zone_id" {
  description = "The hosted zone id for internal dns, e.g., ZFD3TFKDJ1L"
}

