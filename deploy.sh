#!/bin/bash
set -e

echo "🚀 CI/CD Deployment Started..."

cd /home/ubuntu/theepicbook

# Load env vars
export $(grep -v '^#' .env | xargs)

# Use Docker Compose plugin
COMPOSE_CMD="docker compose"

echo "📦 Pulling latest images..."
$COMPOSE_CMD pull

echo "🔄 Restarting stack..."
$COMPOSE_CMD down
$COMPOSE_CMD up -d

echo "✅ Deployment finished"
$COMPOSE_CMD ps
