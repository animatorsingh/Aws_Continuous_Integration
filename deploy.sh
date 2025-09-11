#!/bin/bash
ECR_URI=155343615310.dkr.ecr.ap-south-1.amazonaws.com/my-python-app:latest

# Stop old container
docker stop myapp || true
docker rm -f myapp || true

# Pull latest image
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 155343615310.dkr.ecr.ap-south-1.amazonaws.com
docker pull $ECR_URI

# Run new container
docker run -d --name myapp -p 5000:5000 $ECR_URI
