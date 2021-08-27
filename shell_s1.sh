#!/usr/bin/env bash
# This script install Jenkins in your Ubuntu System
#
# This script must be run as root:
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi
#update package manager
sudo apt-get update


#Install Java
sudo apt install openjdk-8-jdk -y

#Install Jenkins

sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y


# Start Jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

#Save admin password in file
sudo cat /var/lib/jenkins/secrets/initialAdminPassword > password
