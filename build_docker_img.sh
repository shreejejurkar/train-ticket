#!/bin/bash

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

# Iterate over each microservice and build its Docker image
for service in "${microservices[@]}"; do
    echo "Building Docker image for $service..."
    # Check if Dockerfile exists in the microservice directory
    if [ -f "$service/Dockerfile" ]; then
        # Change directory to the microservice directory
        cd "$service" || continue
        # Build Docker image
        docker build -t "$service" .
        # Change directory back to the original location
        cd ..
    else
        echo "Error: Dockerfile not found for $service"
    fi
done
