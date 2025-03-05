clear
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-amd64
ls
chmod +x ./kind
ls -l
kind --version
./kind --version
sudo mv ./kind /usr/local/bin/kind
kind --version
./kubectl version
sudo chmod +x ./kubectl
./kubectl version
kind --version
kubectl version
mkdir kuberrnetes
cd kuberrnetes
ls
vim cluster.yml
kind create cluster --config cluster.yml --name var-cluster
vim cluster.yml
clear
ls
cd kuberrnetes
ls
kind --version
clear
docker ps
ls
cd kuberrnetes
ls
docker ps
ls -l
ls -la
cd ..
ls
kind
kind --version
kubectl version
cd /usr/local/bin/kind
cd /usr/local/bin/
ls
cd ../../..
ls
cd home
ls
cd ubuntu
clear
ls
cd kuberrnetes
ls
cat cluster.yml
clear
ls
sudo apt-get update 
docker --version
sudo apt  install docker.io
sudo usermod -aG docker $USER
newgrp docker
clear
ls
cd kuberrnetes
ls
kind create cluster --config cluster.yml --name priya-cluster
vim cluster.yml
kind create cluster --config cluster.yml --name priya-cluster
vim cluster.yml
kind create cluster --config cluster.yml --name tws-cluster
ls
cd kuberrnetes
ls
kubectl get nodes
kubectl get pods
docker ps
kubectl cluster info
kubectl cluster-info
kubectl config set-context --cluster=kind-tws-cluster --current
kubectl get nodes
kubectl config get-contexts
ls
kubectl get ns
vim namespace.yml
kubectl apply -f namespace.yml
kubectl get ns
clear
vim pod.yml
kubectl apply -f pod.yml
kubectl get pods
kubectl get pods -n nginx-ns
ls
vim online-shop.yml
kubectl apply -f online-shop.yml -n nginx-ns
vim online-shop.yml
kubectl get pods -n nginx-ns
vim service.yml
clear
ls
cd kuberrnetes
ls
