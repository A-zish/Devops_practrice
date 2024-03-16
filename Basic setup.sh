      # This script is for installing all the tools we are gonna use for the setup and practice

#!/bin/bash

# Update package lists
sudo yum update -y

#Insatll Python3
sudo yum install python

#Install aws CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
yum install unzip
unzip awscliv2.zip
sudo ./aws/install
echo "AWSCLI Version: $(aws --version)"

#install git
yum install git

#install java
yum install java
echo "JAVA Version: $(java -version)"

#Install Maven
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
echo "JAVA Version: $(maven -version)"

#Install Jenkins
sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

# Installing Docker
sudo yum install docker -y
sudo systemctl start docker
sudo docker run hello-world
docker --version
