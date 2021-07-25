# Amazon Aurora with AWS Graviton
[AWS Graviton](https://aws.amazon.com/ec2/graviton/) processors are custom built by Amazon Web Services using 64-bit ARM Neoverse cores to deliver the best price performance for you cloud workloads running on Amazon EC2. The new general purpose (M6g), compute-optimized (C6g), and memory-optimized (R6g) instances deliver up to 40% better price/performance over comparable current generation x86-based instances for scale-out and Arm-based applications such as web servers, containerized microservices, caching fleets, and distributed data stores that are supported by the extensive Arm ecosystem.

## Getting started
[Here](https://github.com/aws/aws-graviton-getting-started) is a github repository for a guide to getting started with AWS Graviton. You can find out more details about how to build, run and optimize your application for AWS Graviton processors.

## Download example
Download this example on your workspace
```sh
git clone https://github.com/Young-ook/terraform-aws-aurora
cd terraform-aws-aurora/examples/arm64
```

## Setup
[This](https://github.com/Young-ook/terraform-aws-aurora/blob/master/examples/arm64/main.tf) is the example of terraform configuration file to create an Amazon Aurora for MySQL cluster on your AWS account. Check out and apply it using terraform command.

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

## Additional Resources
* [Amazon's Arm-based Graviton2 Against AMD and Intel](https://www.anandtech.com/show/15578/cloud-clash-amazon-graviton2-arm-against-intel-and-amd)
* [Graviton2 Single Threaded Performance](https://www.anandtech.com/show/15578/cloud-clash-amazon-graviton2-arm-against-intel-and-amd/5)
