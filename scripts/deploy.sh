#!/bin/bash
set -eo pipefail

echo "🚀 Deploying containers..."
docker compose down --timeout 30
docker compose up -d --build --force-recreate

echo "⏳ Waiting for services to start..."
sleep 10

echo "🔍 Running health checks..."
curl -f http://localhost:3000 || { echo "❌ Frontend health check failed"; docker compose logs frontend; exit 1; }
curl -f http://localhost:5000/health || { echo "❌ Backend health check failed"; docker compose logs backend; exit 1; }

echo "✅ Deployment successful!"
docker compose ps
