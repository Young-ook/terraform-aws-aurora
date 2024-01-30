[[English](README.md)] [[한국어](README.ko.md)]

# RDS Blueprint (Amazon Aurora)
This is RDS Blueprint example helps you compose complete RDS clusters that are fully bootstrapped with utilities that is needed to deploy and operate workloads. With this RDS Blueprint example, you describe the configuration for the desired state of your relational database for your application, as an Infrastructure as Code (IaC) template/blueprint. Once a blueprint is configured, you can use it to stamp out consistent environments across multiple AWS accounts and Regions using your automation workflow tool, such as Jenkins, CodePipeline. Also, you can use RDS Blueprint to easily bootstrap an RDS cluster with additional utilities for high availablity. RDS Blueprint also helps you implement relevant security controls needed to operate workloads from multiple teams in the same cluster.

## Setup
### Download
Download this example on your workspace
```
git clone https://github.com/Young-ook/terraform-aws-aurora
cd terraform-aws-aurora/examples/blueprint
```

Then you are in **blueprint** directory under your current workspace. There is an exmaple that shows how to use terraform configurations to create and manage an RDS cluster and additional utilities, such as RDS Proxy, on your AWS account. Check out and apply it using terraform command. If you don't have the terraform tools in your environment, go to the main [page](https://github.com/Young-ook/terraform-aws-aurora) of this repository and follow the installation instructions before you move to the next step.

Run terraform:
```
terraform init
terraform apply
```
Also you can use the *-var-file* option for customized paramters when you run the terraform plan/apply command.
```
terraform plan -var-file fixture.tc1.tfvars
terraform apply -var-file fixture.tc1.tfvars
```

## Utilities
### Amazon RDS Proxy
By using [Amazon RDS Proxy](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-proxy.html), you can allow your applications to pool and share database connections to improve their ability to scale. RDS Proxy makes applications more resilient to database failures by automatically connecting to a standby DB instance while preserving application connections. This is an example on how to create Amazon Aurora cluster and RDS Proxy on the AWS. If you want know more details about RDS Proxy terraform module, please check out [this](https://github.com/Young-ook/terraform-aws-aurora/tree/main/modules/proxy).

## Computing options
### AWS Graviton
[AWS Graviton](https://aws.amazon.com/ec2/graviton/) processors are custom built by Amazon Web Services using 64-bit ARM Neoverse cores to deliver the best price performance for you cloud workloads running on Amazon EC2. The new general purpose (M6g), compute-optimized (C6g), and memory-optimized (R6g) instances deliver up to 40% better price/performance over comparable current generation x86-based instances for scale-out and Arm-based applications such as web servers, containerized microservices, caching fleets, and distributed data stores that are supported by the extensive Arm ecosystem. You can mix x86 and Arm based EC2 instances within a cluster, and easily evaluate Arm-based application in existing environments. Here is a useful [getting started](https://github.com/aws/aws-graviton-getting-started) guide on how to start to use AWS Graviton. This github repository would be good point where to start. You can find out more details about how to build, run and optimize your application for AWS Graviton processors.

To run an example of hybrid-architecture node groups with AWS Graviton, use the another fixture template that configures to only use AWS Graviton based instances. This stap will create both ARM64 and AMD64 architecture based instances for hybrid archtecture computing example.
```
terraform apply -var-file fixture.graviton.tfvars
```

## Applications
- [Benchmark](./apps/README.md#benchmark)

## Clean up
To destroy all infrastrcuture, run terraform:
```
terraform destroy
```

If you don't want to see a confirmation question, you can use quite option for terraform destroy command
```
terraform destroy --auto-approve
```

**[DON'T FORGET]** You have to use the *-var-file* option when you run terraform destroy command to delete the aws resources created with extra variable files.
```
terraform destroy -var-file fixture.tc1.tfvars
```

# Additional Resources
## Amazon Aurora
- [How can I increase the binlog retention in my Aurora MySQL-Compatible DB cluster?](https://repost.aws/knowledge-center/aurora-mysql-increase-binlog-retention)
- [Is Amazon RDS for PostgreSQL or Amazon Aurora PostgreSQL a better choice for me?](https://aws.amazon.com/blogs/database/is-amazon-rds-for-postgresql-or-amazon-aurora-postgresql-a-better-choice-for-me/)
- [Introducing the Aurora Storage Engine](https://aws.amazon.com/ko/blogs/database/introducing-the-aurora-storage-engine/)
- [Improve application availability with the AWS JDBC Driver for Amazon Aurora MySQL](https://aws.amazon.com/ko/blogs/database/improve-application-availability-with-the-aws-jdbc-driver-for-amazon-aurora-mysql)
- [Amazon Aurora-MySQL Workshop](https://catalog.workshops.aws/awsauroramysql/en-US)
- [Modernizing the Amazon Database Infrastructure](https://d1.awsstatic.com/whitepapers/modernizing-amazon-database-infrastructure.pdf?dbd_how1)
- [How LogMeIn migrated a billion records online from Oracle to Amazon Aurora and achieved sub-millisecond response time](https://aws.amazon.com/blogs/modernizing-with-aws/how-logmein-migrated-a-billion-records-online-from-oracle-to-amazon-aurora-and-achieved-sub-millisecond-response-time/)

## Amazon RDS Proxy
- [Improving application availability with Amazon RDS Proxy](https://aws.amazon.com/blogs/database/improving-application-availability-with-amazon-rds-proxy/)

## AWS Graviton
- [Amazon's Arm-based Graviton2 Against AMD and Intel](https://www.anandtech.com/show/15578/cloud-clash-amazon-graviton2-arm-against-intel-and-amd)
- [Graviton2 Single Threaded Performance](https://www.anandtech.com/show/15578/cloud-clash-amazon-graviton2-arm-against-intel-and-amd/5)
- [Key considerations in moving to Graviton2 for Amazon RDS and Amazon Aurora databases](https://aws.amazon.com/blogs/database/key-considerations-in-moving-to-graviton2-for-amazon-rds-and-amazon-aurora-databases/)

## ProxySQL
- [Load Balancing ProxySQL in AWS](https://www.percona.com/blog/load-balancing-proxysql-in-aws/)

## Architecture Patterns
- [CQRS](https://martinfowler.com/bliki/CQRS.html)
