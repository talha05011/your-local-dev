#!/bin/bash
# Test frontend (using compose service name)
docker-compose run --rm frontend \
  curl -s http://frontend:3000 | grep "My App"

# Test backend 
docker-compose run --rm backend \
  curl -s http://backend:5000/health | grep "OK"
