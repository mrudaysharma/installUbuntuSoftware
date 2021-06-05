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
10. Rancher \n
11. Minikube + kubectl\n"

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

echo "Installing Minikube...."

# Update system
sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get upgrade

# Download minikube

wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube

minikube version

# Install kubectl on Ubuntu / Debian
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

kubectl version -o json 

# Starting minikube
minikube start

# Minikube Basic operations
kubectl cluster-info
kubectl config view
kubectl get nodes

# Minicute Stop and Delete
#minikube stop
#minikube delete

minikube addons list
minikube dashboard
minikube dashboard --url



