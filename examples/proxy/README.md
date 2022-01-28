# Amazon RDS Proxy
By using [Amazon RDS Proxy](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-proxy.html), you can allow your applications to pool and share database connections to improve their ability to scale. RDS Proxy makes applications more resilient to database failures by automatically connecting to a standby DB instance while preserving application connections. This is an example on how to create Amazon Aurora cluster and RDS Proxy on the AWS. If you want know more details about RDS Proxy terraform module, please check out [this](https://github.com/Young-ook/terraform-aws-aurora/blob/main/modules/proxy).

## Setup
[This](https://github.com/Young-ook/terraform-aws-aurora/blob/main/examples/proxy/main.tf) is an example of terraform configuration file to create Amazon RDS cluster and proxy. Check out and apply it using terraform command.

If you don't have the terraform tool in your environment, go to the main [page](https://github.com/Young-ook/terraform-aws-aurora) of this repository and follow the installation instructions.

Run terraform:
```
terraform init
terraform apply
```
Also you can use the `-var-file` option for customized paramters when you run the terraform plan/apply command.
```
terraform plan -var-file tc1.tfvars
terraform apply -var-file tc1.tfvars
```

## Clean up
Run terraform:
```
terraform destroy
```
Don't forget you have to use the `-var-file` option when you run terraform destroy command to delete the aws resources created with extra variable files.
```
terraform destroy -var-file tc1.tfvars
```
