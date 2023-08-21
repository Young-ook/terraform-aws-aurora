# Amazon ElastiCache for Redis
[Amazon ElastiCache for Redis](https://aws.amazon.com/elasticache/redis/) is a blazing fast in-memory data store that provides sub-millisecond latency to power internet-scale real-time applications. Built on open-source Redis and compatible with the Redis APIs, ElastiCache for Redis works with your Redis clients and uses the open Redis data format to store your data. Your self-managed Redis applications can work seamlessly with ElastiCache for Redis without any code changes. ElastiCache for Redis combines the speed, simplicity, and versatility of open-source Redis with manageability, security, and scalability from Amazon to power the most demanding real-time applications in Gaming, Ad-Tech, E-Commerce, Healthcare, Financial Services, and IoT.

## Setup
### Prerequisites
This module requires *terraform*. If you don't have the terraform tool in your environment, go to the main [page](https://github.com/Young-ook/terraform-aws-aurora) of this repository and follow the installation instructions.

### Quickstart
```
module "vpc" {
  source  = "Young-ook/vpc/aws"
  version = "1.0.5"
}

module "redis" {
  source  = "Young-ook/aurora/aws//modules/redis"
  vpc     = module.vpc.vpc.id
  subnets = values(module.vpc.subnets["public"])
}
```

Run terraform:
```
terraform init
terraform apply
```
