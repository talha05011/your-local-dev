#!/bin/bash
set -eo pipefail

echo "=== BUILDING ==="
docker compose build

echo "=== DEPLOYING ==="
docker compose up -d

echo "=== VERIFYING ==="
echo "- Checking backend process..."
docker compose exec backend ps aux | grep node || {
  echo "Backend process not running!"
  docker compose logs backend
  exit 1
}

echo "- Testing frontend..."
curl -fs http://localhost:3000 || {
  echo "Frontend failed!"
  docker compose logs frontend
  exit 1
}

echo "✅ SYSTEM READY"
echo "Backend: http://localhost:5000"
echo "Frontend: http://localhost:3000"
