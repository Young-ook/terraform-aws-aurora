# Variables for providing to module fixture codes

### network
variable "aws_region" {
  description = "The aws region to deploy"
  type        = string
}

variable "azs" {
  description = "A list of availability zones"
  type        = list(string)
}

variable "cidr" {
  description = "The vpc CIDR (e.g. 10.0.0.0/16)"
  type        = string
}

### rdb cluster

#  [CAUTION] Changing the snapshot ID. will force a new resource.

variable "aurora_cluster" {
  description = "RDS Aurora for mysql cluster definition"
  default     = {}
}

variable "aurora_instances" {
  description = "RDS Aurora for mysql instances definition"
  default     = []
}

### description
variable "name" {
  description = "The logical name of the module instance"
  type        = string
}

### tags
variable "tags" {
  description = "The key-value maps for tagging"
  type        = map(string)
}
