# Amazon Aurora with PostgreSQL compatibility
## Setup
[This](https://github.com/Young-ook/terraform-aws-aurora/blob/main/examples/postgresql/main.tf) is the example of terraform configuration file to create an Amazon Aurora for PostgreSQL cluster on your AWS account. Check out and apply it using terraform command.

Run terraform:
```
$ terraform init
$ terraform apply
```
Also you can use the `-var-file` option for customized paramters when you run the terraform plan/apply command.
```
$ terraform plan -var-file=default.tfvars
$ terraform apply -var-file=default.tfvars
```

## Clean up
Run terraform:
```
$ terraform destroy
```
Don't forget you have to use the `-var-file` option when you run terraform destroy command to delete the aws resources created with extra variable files.
```
$ terraform destroy -var-file=default.tfvars
````
