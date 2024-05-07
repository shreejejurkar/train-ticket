#!/bin/bash

# Get a list of local Docker images
images=$(docker images --format "{{.Repository}}:{{.Tag}}")

# Iterate over each image and retag it without the "shreejejurkar/" prefix
for image in $images; do
    # Remove the prefix "shreejejurkar/"
    new_image="${image#shreejejurkar/}"
    echo "Retagging $image to $new_image..."
    docker tag "$image" "$new_image"
done
