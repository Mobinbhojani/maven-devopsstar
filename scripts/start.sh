#!/bin/bash

cd /home/ubuntu/app

# Stop and remove previous container if running
docker stop webapp || true
docker rm webapp || true

# Run the latest image from Docker Hub
docker pull mobinbhojani/tomcatstar:latest
docker run -d --name webapp -p 8082:8080 mobinbhojani/tomcatstar:latest

