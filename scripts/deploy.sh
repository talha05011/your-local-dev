#!/bin/bash
docker compose down
docker compose up -d --build
curl -f http://localhost:3000 || { echo "Frontend failed!"; exit 1; }
curl -f http://localhost:5000/health || { echo "Backend failed!"; exit 1; }
