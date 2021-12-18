# Amazon RDS Proxy
By using [Amazon RDS Proxy](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-proxy.html), you can allow your applications to pool and share database connections to improve their ability to scale. RDS Proxy makes applications more resilient to database failures by automatically connecting to a standby DB instance while preserving application connections. By using RDS Proxy, you can also enforce AWS Identity and Access Management (IAM) authentication for databases, and securely store credentials in AWS Secrets Manager.

## Quickstart
### Setup
```hcl
module "proxy" {
  source  = "Young-ook/aurora/aws//modules/proxy"
  name    = var.name
}
```

Run terraform:
```
terraform init
terraform apply
```
