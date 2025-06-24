#!/bin/bash
# Build both containers with local tags
docker build -t frontend:local ./client
docker build -t backend:local ./server
