#!/bin/bash

SOURCE_DIR="/path/to/source"
BACKUP_DIR="/path/to/backup"
# SOURCE_DIR="/c/Users/Amrit/OneDrive/Desktop/Marnine"
# BACKUP_DIR="/d/tmp"

# Create a timestamp for this backup
DATE=$(date +'%Y-%m-%d_%H-%M-%S')
BACKUP_NAME="backup_$DATE.tar.gz"


# Create backup directory if not exists
mkdir -p "$BACKUP_DIR"
tar -czvf "$BACKUP_DIR/$BACKUP_NAME" -C "$SOURCE_DIR" .

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "✅ Backup completed successfully!"
    echo "Backup file: $BACKUP_DIR/$BACKUP_NAME"
else
    echo "❌ Backup failed!"
fi
