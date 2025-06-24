#!/bin/bash
echo "=== Stopping Old Containers ==="
docker-compose down

echo "=== Deploying New Versions ==="
docker-compose up -d --build

echo "=== Health Checks ==="
curl -f http://localhost:3000 || { echo "Frontend failed!"; exit 1; }
curl -f http://localhost:5000/health || { echo "Backend failed!"; exit 1; }
