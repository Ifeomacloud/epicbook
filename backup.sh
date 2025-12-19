#!/bin/bash
TIMESTAMP=$(date +%F_%H-%M-%S)
BACKUP_DIR="/backups"
mkdir -p $BACKUP_DIR

# DB Backup
docker exec epicbook-db pg_dump -U $DB_USER $DB_NAME > $BACKUP_DIR/db_$TIMESTAMP.sql

# Optional: App Data Backup
docker run --rm -v epicbook_app_data:/data -v $BACKUP_DIR:/backup alpine \
  tar czf /backup/appdata_$TIMESTAMP.tar.gz -C /data .

echo "Backup completed at $BACKUP_DIR"
