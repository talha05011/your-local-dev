#!/bin/bash
set -eo pipefail

echo "=== BUILDING ==="
docker compose build

echo "=== DEPLOYING ==="
docker compose up -d backend frontend

echo "=== RUNNING TESTS ==="
docker compose run --rm backend-test

echo "=== VERIFYING ==="
curl -f http://localhost:5000 && echo "Backend OK" || echo "Backend Error"
curl -f http://localhost:3000 && echo "Frontend OK" || echo "Frontend Error"

echo "✅ Pipeline completed successfully"
docker compose ps
