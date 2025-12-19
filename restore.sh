#!/bin/bash
BACKUP_FILE=$1

if [ -z "$BACKUP_FILE" ]; then
  echo "Usage: restore.sh <backup_file.sql>"
  exit 1
fi

docker exec -i epicbook-db psql -U $DB_USER -d $DB_NAME < $BACKUP_FILE
echo "Restore completed from $BACKUP_FILE"
