#!/bin/bash
echo "=== MANUAL ROLLBACK TRIGGERED ==="
docker-compose down
docker tag your-local-dev-backend:previous your-local-dev-backend:latest
docker tag your-local-dev-frontend:previous your-local-dev-frontend:latest
docker-compose up -d
echo "✅ Rollback complete! Previous version restored."
