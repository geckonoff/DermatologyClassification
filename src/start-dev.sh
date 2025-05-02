#!/bin/bash

echo "I love automatisation"
# Start Docker desktop
echo "Starting Docker Desktop..."
open -a Docker
# Wait for Docker to start
while ! docker info >/dev/null 2>&1; do
    echo "Waiting for Docker to start..."
    sleep 5
done
echo "Docker is running."
# Start the Docker existing container dermatology
echo "Starting existing Docker container..."
docker start derma
# Wait for the container to be ready
sleep 10
echo "Container is ready."
# Print http refference from container derma logs started from http://127.0.0.1..... using sed 
docker logs derma 2>&1 | grep -oE 'http://127\.0\.0\.1:8888/tree\?token=[a-f0-9]+' | tail -n 1
### Change current settings vscode Jupyter server URL to the one from the logs
##echo "Changing Jupyter server URL in VSCode settings..."
### TOKEN=$(docker logs derma 2>&1 | grep -oE 'http://127\.0\.0\.1:8888/tree\?token=[a-f0-9]+' | tail -n 1 | grep -oE '[a-f0-9]+' | tail -n 1)
### Get the current settings file path
##settings_file="$HOME/Library/Application Support/Code/User/settings.json"
### Check if the settings file exists
##if [ -f "$settings_file" ]; then
##    # Use sed to define Jupyter server URL in the settings file
##    sed -i '' "s#\(\"jupyter\.serverURI\": \"http://[^?]*?token=\)[^\"]*#\1$TOKEN#" "$settings_file"
##    echo "Jupyter server URL changed in VSCode settings."
##else
##    echo "Settings file not found: $settings_file"
##fi
### Reload VSCode
##echo "Reloading VSCode..."
##code -r
##