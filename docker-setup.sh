#!/bin/bash
# FLOWUnsteady Docker Setup Script
# This script builds the Docker image and optionally installs Julia packages

set -e

echo "========================================="
echo "FLOWUnsteady Docker Setup"
echo "========================================="
echo ""

# Build the Docker image
echo "Building Docker image with system dependencies..."
docker compose build

echo ""
echo "Docker image built successfully!"
echo ""

# Ask user if they want to install Julia packages
read -p "Install Julia packages now? This may take several minutes. (y/n) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo ""
    echo "Installing Julia packages..."
    echo ""

    docker compose run --rm flowunsteady julia --project setup.jl

    echo ""
    echo "========================================="
    echo "Setup Complete!"
    echo "========================================="
    echo ""
    echo "Start the development container with:"
    echo "  docker compose up -d"
    echo "  docker compose exec flowunsteady bash"
    echo ""
    echo "Or run examples directly:"
    echo "  docker compose run --rm flowunsteady julia --project examples/propeller1.jl"
    echo ""
else
    echo ""
    echo "========================================="
    echo "Setup Partial"
    echo "========================================="
    echo ""
    echo "Docker image built, but Julia packages not installed."
    echo ""
    echo "To install packages later, run:"
    echo "  docker compose run --rm flowunsteady julia --project setup.jl"
    echo ""
    echo "Or start the container and install manually:"
    echo "  docker compose up -d"
    echo "  docker compose exec flowunsteady bash"
    echo "  julia --project setup.jl"
    echo ""
fi
