#!/bin/bash
set -e

echo "CI/CD Deployment Started..."

cd /home/ubuntu/epicbook

# Load env vars
export $(grep -v '^#' .env | xargs)

echo "📦 Pulling latest images..."
docker-compose pull

echo "🔄 Restarting stack..."
docker-compose down
docker-compose up -d

echo "✅ Deployment finished"
docker-compose ps
