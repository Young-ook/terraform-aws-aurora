### network
variable "vpc" {
  description = "The VPC ID to deploy the cluster"
  type        = string
}

variable "cidrs" {
  description = "The list of CIDR blocks to allow ingress traffic for db access"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnets" {
  description = "The list of subnet IDs to deploy the cluster"
  type        = list(string)
}

### rdb cluster (aurora)

#  [CAUTION] Changing the snapshot ID. will force a new resource.

variable "aurora_cluster" {
  description = "RDS Aurora for mysql cluster definition"
  default = {
    engine             = "aurora-mysql"
    mode               = "provisioned" # Allowed values: global, multimaster, parallelquery, provisioned, serverless.
    version            = "5.7.12"
    port               = "3306"
    user               = "yourid"
    database           = "yourdb"
    apply_immediately  = "false"
    cluster_parameters = {}
  }
}

variable "aurora_instances" {
  description = "RDS Aurora for mysql instances definition"
  default = [
    {
      node_type           = "db.t3.medium"
      instance_parameters = {}
    }
  ]
}

### description
variable "name" {
  description = "The logical name of the module instance"
  type        = string
  default     = null
}

### tags
variable "tags" {
  description = "The key-value maps for tagging"
  type        = map(string)
  default     = {}
}
