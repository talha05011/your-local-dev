#!/bin/bash
curl -f http://localhost:3000 && echo "Frontend OK" || echo "Frontend Error"
curl -f http://localhost:5000/health && echo "Backend OK" || echo "Backend Error"
