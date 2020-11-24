# Amazon Aurora
[Amazon Aurora](https://aws.amazon.com/rds/aurora/) is a MySQL and PostgreSQL-compatible relational database built for the cloud, that combines the performance and availability of traditional enterprise databases with the simplicity and cost-effectiveness of open source databases.

* This module will create an Amazon Aurora Cluster on AWS.

## Examples
- [MySQL Example](https://github.com/Young-ook/terraform-aws-aurora/blob/master/examples/mysql)

## Quickstart
### Setup
```hcl
module "aurora" {
  source  = "Young-ook/aurora/aws"
  name    = "aurora"
  tags    = { env = "test" }
}
```
Run terraform:
```
$ terraform init
$ terraform apply
```
