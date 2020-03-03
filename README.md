[![FlorianBorn](https://circleci.com/gh/FlorianBorn/operationalize-a-machine-learning-microservice-api.svg?style=svg)](https://app.circleci.com/gh/FlorianBorn/operationalize-a-machine-learning-microservice-api/pipelines)

### Project Goal

The project's goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/)
For this, the following steps are performed:
* complete a given Dockerfile
* lint the project's code and the Dockerfile
* build a Docker Image from the Dockerfile
* run the Docker Image and test if we can make predictions 
* add logging statements to the web app (app.py)
* upload the Docker iIage to Docker Hub
* configure and run minik8s
* test if we the service is working by making a predictions
* integrate CircleCI
---

### Files
**Dockerfile**: a template for creating the Docker Image (containing the web service)<br>
**Makefile**: Contains the neccessary commands to setup the environment, install requirements, make tests and lint the project's files<br>
**make_predictions.sh**: use curl to make a dummy call to the app<br>
**requirements.txt**: contains all required python libraries<br>
**run_docker.sh**: build and run the image containing the app<br>
**run_kubernetes.sh**: deploy the app (image) on kubernetes<br>
**upload_docker.sh**: push the Docker Image to Docker Hub<br>

## Setup the Base Environment
1. Install VMware
2. Create a VM with Ubuntu 18.04
3. in the VM's settings activate **Virtualize Intel VT-x/EPT or AMD-V/RVI**

## Setup the Environment

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

1. Setup and Configure Docker locally<br>
`apt install docker.io`<br>
2. Setup and Configure Kubernetes locally
* Install kubctl<br>
```
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
    kubectl version --client
```
* Install a Hypervisor (here we will use VirtualBox)<br>
```
    sudo add-apt-repository multiverse && sudo apt-get update
    sudo apt install virtualbox
```
* Install Minikube<br>
```
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube
    sudo mkdir -p /usr/local/bin/  # if not already existing
    sudo install minikube /usr/local/bin/
```
* Start Minikube and test if it was installed correctly
```
    minikube start --vm-driver=virtualbox
    minikube status
```
3. Create Flask app in Container
```
    ./run_docker.sh
    ./upload_docker.sh
```
4. Run via kubectl
```
    ./run_kubernetes.sh
``` 
