#!/bin/bash
set -e

echo "🚀 CI/CD Deployment Started..."

cd /home/ubuntu/theepicbook

# Load env vars
export $(grep -v '^#' .env | xargs)

# Use Docker Compose plugin
COMPOSE_CMD="docker compose"

# Check if Docker is available
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed or not in PATH."
    exit 1
fi

# Check if Docker Compose v5 plugin works
if ! $COMPOSE_CMD version &> /dev/null; then
    echo "❌ Docker Compose v5 plugin not found. Make sure you have 'docker compose' available."
    exit 1
fi

echo "📦 Pulling latest images..."
$COMPOSE_CMD pull

echo "🔄 Restarting stack..."
$COMPOSE_CMD down
$COMPOSE_CMD up -d

echo "✅ Deployment finished"
$COMPOSE_CMD ps
