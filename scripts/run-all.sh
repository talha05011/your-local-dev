#!/bin/bash
set -e

echo "=== BUILDING ==="
docker-compose build

echo "=== DEPLOYING ==="
docker-compose up -d backend frontend

echo "=== TESTING ==="
docker-compose run --rm backend-test

echo "✅ Pipeline completed successfully"
