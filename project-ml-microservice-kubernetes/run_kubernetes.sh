#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub
name=house-price-model

# Step 1:
# This is your Docker ID/path
dockerpath=n02291/house-price-model

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run $name --image=$dockerpath --port=80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
#kubectl expose --type=LoadBalancer deployment $name --port=80
sleep 3
kubectl port-forward deployment/$name 80:80

# Step 5:
# Show running services
kubectl get services

