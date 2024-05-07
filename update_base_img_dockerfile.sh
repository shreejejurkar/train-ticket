#!/bin/bash

# Define the base directory where microservices directories are located
base_dir="."

# Define the list of microservices
microservices=(
    "ts-common"
    "ts-verification-code-service"
    "ts-contacts-service"
    "ts-order-service"
    "ts-order-other-service"
    "ts-config-service"
    "ts-station-service"
    "ts-train-service"
    "ts-travel-service"
    "ts-travel2-service"
    "ts-preserve-service"
    "ts-preserve-other-service"
    "ts-basic-service"
    "ts-price-service"
    "ts-notification-service"
    "ts-security-service"
    "ts-inside-payment-service"
    "ts-execute-service"
    "ts-payment-service"
    "ts-rebook-service"
    "ts-cancel-service"
    "ts-route-service"
    "ts-assurance-service"
    "ts-seat-service"
    "ts-travel-plan-service"
    "ts-route-plan-service"
    "ts-food-service"
    "ts-station-food-service"
    "ts-consign-price-service"
    "ts-consign-service"
    "ts-admin-order-service"
    "ts-admin-basic-info-service"
    "ts-admin-route-service"
    "ts-admin-travel-service"
    "ts-admin-user-service"
    "ts-auth-service"
    "ts-user-service"
    "ts-delivery-service"
    "ts-train-food-service"
    "ts-gateway-service"
    "ts-food-delivery-service"
    "ts-wait-order-service"
)

# Function to search and replace in Dockerfile
search_replace() {
    local dockerfile="$1"
    # Replace "FROM java:8-jre" with "FROM openjdk:11"
    sed -i 's/FROM java:8-jre/FROM openjdk:11/' "$dockerfile"
    # Get the microservice name from the Dockerfile path
    local microservice_name=$(basename "$(dirname "$dockerfile")")
    # Replace "ADD ./target/ts-station-service-1.0.jar /app/" with "ADD ./{microservice name}/target/ts-station-service-1.0.jar /app/"
    sed -i "s#ADD \./${microservice_name}/target/${microservice_name}-1\.0\.jar /app/#ADD ./target/${microservice_name}-1.0.jar /app/#" "$dockerfile"
}

# Find all Dockerfile files in the microservices directories and update them
for service in "${microservices[@]}"; do
    dockerfile_path="$base_dir/$service/Dockerfile"
    if [ -f "$dockerfile_path" ]; then
        echo "Updating $dockerfile_path..."
        search_replace "$dockerfile_path"
    else
        echo "Dockerfile not found for $service"
    fi
done
