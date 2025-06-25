#!/bin/bash
set -eo pipefail

echo "Running frontend test..."
curl -f http://localhost:3000 && echo "✅ Frontend OK" || { echo "❌ Frontend Error"; exit 1; }

echo "Running backend test..."
curl -f http://localhost:5000/health && echo "✅ Backend OK" || { echo "❌ Backend Error"; exit 1; }

echo "✅ All tests passed!"
