#!/bin/bash
# Stop existing containers
docker stop frontend-local backend-local || true

# Run new containers
docker run -d -p 3000:3000 --name frontend-local frontend:local
docker run -d -p 5000:5000 --name backend-local backend:local

echo "Services running:"
echo "- Frontend: http://localhost:3000"
echo "- Backend: http://localhost:5000/health"
