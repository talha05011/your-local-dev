#!/bin/bash
set -eo pipefail

echo "=== BUILDING ==="
docker compose build || {
    echo "❌ Build failed"
    docker compose logs
    exit 1
}

echo "=== DEPLOYING ==="
docker compose up -d

echo "=== RUNNING TESTS ==="
docker compose run --rm backend-test || {
    echo "❌ Tests failed"
    docker compose logs backend-test
    exit 1
}

echo "✅ Pipeline completed successfully"
