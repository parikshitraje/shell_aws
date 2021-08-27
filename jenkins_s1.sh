#!/usr/bin/env bash
# This script install Jenkins in your Amazon AMI

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_COLLATE=C
export LC_CTYPE=en_US.UTF-8

# To ensure that your software packages are up to date on your instance
sudo yum update –y

# Add the Jenkins repo

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import a key file from Jenkins-CI to enable installation from the package
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key


sudo yum upgrade

#Install Jenkins

sudo yum install jenkins java-1.8.0-openjdk-devel -y

sudo systemctl daemon-reload

#Start Jenkins as a service:
sudo systemctl start jenkins

# Check the status of the Jenkins service
sudo systemctl status jenkins


#sudo yum update -y
#Install Docker on system
sudo yum install docker -y

#Start the Docker service.
sudo service docker start

#Add the ec2-user to the docker group so you can execute Docker commands without using sudo.
sudo usermod -a -G docker ec2-user jenkins

# Use the following command to display / store this password:
touch password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword > password

sudo systemctl restart jenkins