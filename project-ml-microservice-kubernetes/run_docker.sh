#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build --network=host -t house-price-model .

# Step 2: 
# List docker images
docker images

# Step 3: 
# Run flask app
docker run --rm -p 80:80 --name house-price-model house-price-model
