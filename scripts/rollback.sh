#!/bin/bash
set -eo pipefail

echo "⚠️ MANUAL ROLLBACK INITIATED ⚠️"
echo "Stopping current containers..."
docker compose down --timeout 30

echo "Rolling back to previous version..."
docker tag your-local-dev-backend:previous your-local-dev-backend:latest || \
  { echo "❌ Failed to tag backend"; exit 1; }
docker tag your-local-dev-frontend:previous your-local-dev-frontend:latest || \
  { echo "❌ Failed to tag frontend"; exit 1; }

echo "Starting previous version..."
docker compose up -d

echo "✅ Rollback complete! Previous version restored."
sleep 5
docker compose ps
