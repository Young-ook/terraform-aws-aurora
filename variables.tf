# variables.tf

### network
variable "vpc" {
  description = "The vpc id to deploy"
}

variable "subnets" {
  description = "The list of subnet ids to deploy"
  type        = "list"
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

variable "mysql_master_password" {
  description = "The name of master user of mysql"
  default     = "^changeme^"
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

### tags
variable "tags" {
  description = "The key-value maps for tagging"
  type        = "map"
}

### description
variable "app_name" {
  description = "The logical name of the module instance"
  default     = "mysql"
}

variable "app_detail" {
  description = "The extra description of module instance"
  default     = ""
}

variable "stack" {
  description = "Text used to identify stack of infrastructure components"
  default     = "default"
}

variable "slug" {
  description = "A random string to be end of tail of module name"
  default     = ""
}

### dns
variable "dns_zone" {
  description = "The hosted zone name for internal dns, e.g., ${var.dns_zone}.internal"
}

variable "dns_zone_id" {
  description = "The hosted zone id for internal dns, e.g., ZFD3TFKDJ1L"
}
