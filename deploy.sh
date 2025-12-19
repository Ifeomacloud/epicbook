#!/bin/bash
set -e

echo "CI/CD Deployment Started..."

cd /home/ubuntu/epicbook

# Load env vars
export $(grep -v '^#' .env | xargs)

# Determine whether to use old docker-compose or new plugin
if command -v docker-compose &> /dev/null; then
    COMPOSE_CMD="docker-compose"
elif docker compose version &> /dev/null; then
    COMPOSE_CMD="docker compose"
else
    echo "Error: docker-compose not found. Install docker-compose or Docker Compose plugin."
    exit 1
fi

echo "📦 Pulling latest images..."
$COMPOSE_CMD pull

echo "🔄 Restarting stack..."
$COMPOSE_CMD down
$COMPOSE_CMD up -d

echo "✅ Deployment finished"
$COMPOSE_CMD ps
