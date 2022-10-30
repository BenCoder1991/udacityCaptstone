#!/usr/bin/env bash

## Helper sheet to test with Docker locally
## Reference: https://www.docker.com/sites/default/files/d8/2019-09/docker-cheat-sheet.pdf and previous microservices submission

# step 0:
# make install
# make lint

# Step 1:
docker build --tag=nginxapp .

# Step 2: 
# List docker images
# https://docs.docker.com/engine/reference/commandline/images/
docker images --all

# Step 3: 
# Run flask app
# Container port 80, make-preduction port 8000 (which uses the running app)
docker run -p 8000:80 nginxapp