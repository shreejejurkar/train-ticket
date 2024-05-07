#!/bin/bash

# Define the remote repository URL
remote_repo="shreejejurkar/train-ticket"

# Login to Docker (if necessary)
docker login

# Get a list of local Docker images
images=$(docker images --format "{{.Repository}}:{{.Tag}}")

# Iterate over each image and push it to the remote repository
for image in $images; do
    echo "Pushing $image to $remote_repo..."
    docker push "$remote_repo/$image"
done

echo "All images pushed to $remote_repo"
