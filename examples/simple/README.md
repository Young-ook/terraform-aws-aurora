# Example of aurora cluster for mysql

## Usage
You can use this module like as below example.

### Initialise
This is the first step to create a spinnaker cluster. Just get terraform module and apply it and this is sort of terraform command to do `terraform init`, `terraform plan -var-file default.tfvars`, and `terraform apply -var-file default.tfvars`. After then you will see so many resources like rds, r53, and others on aws.

#### Easy and simple example
```
module "spinnaker" {
  source          = "git::git@github.com:Young-ook/terraform-aws-mysql.git?ref=1.0.0"
  name            = "mysql"
  stack           = var.stack
  vpc             = module.vpc.id
  subnets         = module.vpc.private_subnets
  source_sg       = var.src_sg_id
  dns_zone        = var.dns_zone
  dns_zone_id     = var.dns_zone_id
  tags            = { "env" = "dev" }
  mysql_version   = "5.7.12"
  mysql_node_type = "db.r4.large"
}
```
