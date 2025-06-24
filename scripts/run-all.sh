#!/bin/bash
set -e  # Exit on error

echo "=== BUILDING ==="
./build.sh

echo "=== BACKING UP CURRENT VERSION ==="
docker tag your-local-dev-backend:latest your-local-dev-backend:previous || true
docker tag your-local-dev-frontend:latest your-local-dev-frontend:previous || true

echo "=== DEPLOYING ==="
./deploy.sh

echo "=== TESTING ==="
if ./test.sh; then
  echo "✅ Pipeline completed successfully"
else
  echo "❌ Tests failed! Rolling back..."
  docker tag your-local-dev-backend:previous your-local-dev-backend:latest || true
  docker tag your-local-dev-frontend:previous your-local-dev-frontend:latest || true
  docker-compose up -d  # Restore previous version
  echo "🔄 Rolled back to last stable version"
  exit 1
fi
