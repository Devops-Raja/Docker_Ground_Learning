#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull ram7800/demo_pythonapp/

# Run the Docker image as a container
docker run -d -p 5000:5000 ram7800/demo_pythonapp
