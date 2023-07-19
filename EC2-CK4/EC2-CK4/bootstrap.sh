#!/bin/bash

# Update the system packages
sudo apt update

# Install Docker
sudo apt install -y docker.io

# Add the current user to the docker group
sudo usermod -aG docker $USER

# Start Docker
sudo service docker start

# Install kubectl via Snap
sudo snap install kubectl --classic

# Install Minikube dependencies
sudo apt install -y conntrack

# Install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

# Install K8s crictl
curl -LO https://github.com/kubernetes-sigs/cri-tools/releases/latest/download/crictl-v1.27.1-linux-amd64.tar.gz
tar -zxvf crictl-v1.27.1-linux-amd64.tar.gz
sudo install crictl /usr/local/bin/crictl
rm crictl crictl-v1.27.1-linux-amd64.tar.gz

# Start Minikube with Docker driver
minikube start --driver=docker --profile=minikube --force

# Wait for Minikube to be ready
minikube status --wait

# Configure kubectl to use Minikube cluster
eval $(minikube docker-env)
echo "source <(minikube completion bash)" >> ~/.bashrc

# Add Minikube profile to user's environment
echo "export MINIKUBE_PROFILE=minikube" >> ~/.bashrc

# Restart Minikube
minikube stop
sudo minikube start --driver=docker --profile=minikube --force

# Enable kubelet service
sudo systemctl enable kubelet.service

# Scale down the deployment
kubectl scale deployment coredns --replicas=1 -n kube-system

# Verify Minikube cluster
kubectl cluster-info
echo "Minikube cluster has been successfully set up!"
