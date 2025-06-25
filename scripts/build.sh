#!/bin/bash
set -eo pipefail

echo "➡️ Cleaning up..."
docker compose down --remove-orphans --volumes --timeout 30

echo "➡️ Building images..."
docker compose build --no-cache --pull

echo "➡️ Running tests..."
docker compose run --rm backend npm run test
docker compose run --rm frontend npm run test

echo "✅ Build completed successfully"
