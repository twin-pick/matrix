#!/bin/bash
set -e

EXPOSED_PORT=${1:-8081}

echo "🔧 Building image..."
docker build -t jarvis -f ./docker/jarvis/Dockerfile ..

echo "🚀 Running container..."
docker run \
  -p "8081":"$EXPOSED_PORT" \
  jarvis