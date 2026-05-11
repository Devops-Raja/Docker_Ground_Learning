#!/bin/bash
set -e

# Stop the running container (if any)
docker stop demo_pythonapp
docker rm -f demo_pythonapp