#!/bin/bash
set -e

echo "🚀 CI/CD Deployment Started..."

cd /home/ubuntu/theepicbook

export $(grep -v '^#' .env | xargs)

docker compose pull
docker compose down
docker compose up -d

docker compose ps
