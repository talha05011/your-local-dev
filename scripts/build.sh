#!/bin/bash
set -e  # Exit on error

# Clean orphans
docker compose down --remove-orphans

# Build
docker compose build

# Test
docker compose run --rm backend npm test
docker compose run --rm frontend npm test
