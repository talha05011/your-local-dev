#!/bin/bash
set -eo pipefail

echo "=== BUILDING ==="
docker compose build

echo "=== DEPLOYING ==="
docker compose up -d

echo "=== VERIFYING ==="
echo "- Waiting for backend (max 30s)..."
timeout 30 bash -c 'until docker compose exec backend curl -f http://localhost:5000; do sleep 2; done' || {
  echo "Backend failed to start!"
  docker compose logs backend
  exit 1
}

echo "- Testing Frontend:"
curl -f http://localhost:3000 || {
  echo "Frontend failed!"
  docker compose logs frontend
  exit 1
}

echo "✅ All systems operational!"
docker compose ps
