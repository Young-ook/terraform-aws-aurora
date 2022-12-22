[[English](README.md)] [[한국어](README.ko.md)]

# Applications
## Benchmark
### Connect to EC2
Move to the EC2 service page on the AWS Management Conosol and select Instances button on the left side menu. Find an instance that you launched. Select the instance and click 'Connect' button on top of the window. After then you will see three tabs EC2 Instance Connect, Session Manager, SSH client. Select Session Manager tab and follow the instruction on the screen.

### Install sysbench
Run below command to install sysbench and database clients on your EC2 workspace:
```
curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.rpm.sh | sudo bash
sudo yum -y install mysql postgresql sysbench
```

Make sure the installation is complete. If the output looks like `sysbench 1.0.20`, then sysbench is installed properly.
```
sysbench --version
```

# Known Issues
