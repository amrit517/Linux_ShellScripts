#!/bin/bash

# Usage: ./backup_rotation_sftp.sh /local/backup/folder sftp://user@host:/remote/backup/folder retention_count

LOCAL_BACKUP_DIR=$1
REMOTE_BACKUP_DIR=$2
RETENTION_COUNT=$3
SFTP_HOST=$(echo "$REMOTE_BACKUP_DIR" | cut -d':' -f2 | cut -d'/' -f1)
SFTP_USER=$(echo "$REMOTE_BACKUP_DIR" | cut -d'@' -f1 | cut -d':' -f2)
REMOTE_DIR=$(echo "$REMOTE_BACKUP_DIR" | cut -d':' -f2-)

# --- Check if arguments are provided ---
if [ -z "$LOCAL_BACKUP_DIR" ] || [ -z "$REMOTE_BACKUP_DIR" ] || [ -z "$RETENTION_COUNT" ]; then
    echo "Usage: $0 /local/backup/folder sftp://user@host:/remote/backup/folder retention_count"
    exit 1
fi

# --- Validate local backup directory ---
if [ ! -d "$LOCAL_BACKUP_DIR" ]; then
    echo "Error: Local backup directory '$LOCAL_BACKUP_DIR' does not exist."
    exit 1
fi

# --- Validate remote backup directory ---
echo "🔍 Checking remote backup directory..."

if ! ssh "$SFTP_USER@$SFTP_HOST" "test -d '$REMOTE_DIR'"; then
    echo "Error: Remote backup directory '$REMOTE_DIR' does not exist or cannot be accessed."
    exit 1
fi

# --- Check if retention count is a number ---
if ! [[ "$RETENTION_COUNT" =~ ^[0-9]+$ ]]; then
    echo "Error: Retention count must be a positive integer."
    exit 1
fi

# --- Download latest backups from remote server ---
echo "🔄 Downloading the latest backups from remote server..."
mkdir -p "$LOCAL_BACKUP_DIR"

# Use SFTP to download files (or FTP)
# Download only the latest files to LOCAL_BACKUP_DIR
sftp "$SFTP_USER@$SFTP_HOST:$REMOTE_DIR" <<EOF
mget * "$LOCAL_BACKUP_DIR"
EOF

# --- Rotate backups locally ---
echo "🔍 Rotating local backups..."

# Get list of files in the local backup directory
BACKUPS=($(ls -t "$LOCAL_BACKUP_DIR"))  # Sort files by modification time

TOTAL_BACKUPS=${#BACKUPS[@]}

if [ "$TOTAL_BACKUPS" -gt "$RETENTION_COUNT" ]; then
    BACKUPS_TO_DELETE=$((TOTAL_BACKUPS - RETENTION_COUNT))
    echo "Deleting $BACKUPS_TO_DELETE old backups..."

    for ((i=RETENTION_COUNT; i<TOTAL_BACKUPS; i++)); do
        BACKUP_FILE="${BACKUPS[$i]}"
        echo "Deleting: $BACKUP_FILE"
        rm -f "$LOCAL_BACKUP_DIR/$BACKUP_FILE"
    done

    echo "✅ Old backups deleted, $RETENTION_COUNT backups remain."
else
    echo "✅ No backups need to be deleted. You have $TOTAL_BACKUPS backups."
fi

# --- Delete backups older than X days ---
RETENTION_DAYS=30
echo "🔍 Deleting backups older than $RETENTION_DAYS days..."

find "$LOCAL_BACKUP_DIR" -type f -mtime +$RETENTION_DAYS -exec rm -f {} \;
echo "✅ Backups older than $RETENTION_DAYS days deleted."
