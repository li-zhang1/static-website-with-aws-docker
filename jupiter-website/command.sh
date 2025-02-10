#!/bin/bash

docker build -t jupiter .

docker image ls

docker run -dp 80:80 jupiter

localhost:80

docker ps

docker stop <container-id>

# create a repo in docker hub first.

docker tag <old-docker-name> <your-docker-hub-username/docker-repo-name>

docker login -u <your-docker-hub-username>

docker push <your-docker-hub-username/docker-repo-name>


# create a repo in aws ECR
aws ecr create-repository --repository-name jupiter --region us-east-1

docker tag jupiter <uri-of-repository-in-aws-ecr>

aws ecr get-login-password | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.<region>.amazonaws.com

docker push <uri-of-repository-in-aws-ecr>