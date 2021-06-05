#!/bin/bash

printf "Installing Required Software in Ubuntu Environment \n
1. Java \n
2. Maven \n
3. RabittVCS \n
4. Docker \n
5. Kubeclt \n
6. Helm \n
7. Intellij \n
8. Google Chrome \n
9. Openshift \n
10. Rancher \n"

echo "Installin Java........"

sudo apt-get update
sudo apt-get install openjdk-11-jdk
java --version

echo "Java Installed "

echo "Installing Maven........"

sudo apt update
sudo apt install maven
mvn -version

echo "Maven Installed "

echo "Installing RabittVCS......"

sudo apt-get install rabbitvcs-core rabbitvcs-cli rabbitvcs-gedit rabbitvcs-nautilus 

echo "RabittVCS Installed "

echo "Installing Docker......"

sudo apt update

# Downloading Dependencies
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

# Adding Docker’s GPG Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add –

# Installing the Docker Repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"

# Installing the Latest Docker
sudo apt update
sudo apt-get install docker-ce
docker --version
sudo docker login -u dockermickey -p Mayank223388

# Enable Docker Service 
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

# Installing Docker
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io
docker --version

# Enable Docker Service
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

# Run Docker Commands Without Sudo
sudo groupadd docker
sudo usermod -a -G docker $(whoami)
su - $(whoami)
id -nG

echo "Docker Installed"

echo "Installing Kubectl....."

sudo snap install kubectl --classic
kubectl version

echo "Kubectl Installed"

echo "Installing Helm....."

sudo apt install snapd
sudo snap install helm --classic

echo "Helm Installed "

echo "Installing Google Chrome...."

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

echo "Google Chrome Installed"

echo "Installing Intellij Ultimate...."

sudo snap install intellij-idea-ultimate --classic --edge

echo "Intellij Installed"

echo "Installing Rancher..."

sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/server:stable

echo "Rancher Installed"



