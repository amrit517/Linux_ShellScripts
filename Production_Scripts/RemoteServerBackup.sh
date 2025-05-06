#!/bin/bash

# Set the source and destination directories for local backup
SOURCE_DIR="/path/to/source"          # Path to your source directory
LOCAL_BACKUP_DIR="/path/to/backup/directory"  # Path to your local backup directory

# Set the remote server details for SFTP transfer
REMOTE_USER="your_sftp_user"          # Your SFTP username
REMOTE_HOST="remote.server.com"       # Remote server address
REMOTE_DIR="/path/to/remote/backup/directory"  # Remote directory to store backups

# Define the number of days before backups should be deleted
DAYS_OLD=7

# =================== Backup with rsync ===================
echo "Starting local backup using rsync..."

# Use rsync to sync files from source to local backup directory
rsync -avz --delete "$SOURCE_DIR" "$LOCAL_BACKUP_DIR"
if [ $? -eq 0 ]; then
    echo "✅ Local backup completed successfully!"
else
    echo "❌ Local backup failed!"
    exit 1
fi

# =================== Transfer Backup via SFTP ===================
echo "Starting transfer of backup files to remote server..."

# Use SFTP to transfer backup files to the remote server
# We use "mput" to upload all backup files matching "*.tar.gz"
sftp "$REMOTE_USER@$REMOTE_HOST" <<EOF
cd $REMOTE_DIR
mput $LOCAL_BACKUP_DIR/*.tar.gz
bye
EOF

# Check if SFTP command was successful
if [ $? -eq 0 ]; then
    echo "✅ Backup files transferred successfully to remote server!"
else
    echo "❌ Backup transfer to remote server failed!"
    exit 1
fi

# =================== Clean up old backups locally ===================
echo "Cleaning up local backups older than $DAYS_OLD days..."

# Find and delete backup files older than specified days (7 days in this case)
find "$LOCAL_BACKUP_DIR" -type f -name "*.tar.gz" -mtime +$DAYS_OLD -exec rm -f {} \;

# Check if cleanup was successful
if [ $? -eq 0 ]; then
    echo "✅ Local old backups have been removed successfully."
else
    echo "❌ Failed to remove old local backups."
    exit 1
fi

# =================== Clean up old backups remotely via SFTP ===================
echo "Cleaning up remote backups older than $DAYS_OLD days..."

# Run a command over SFTP to remove old backups on the remote server
sftp "$REMOTE_USER@$REMOTE_HOST" <<EOF
cd $REMOTE_DIR
# Find and delete backups older than specified days (7 days in this case) on the remote server
find . -type f -name "*.tar.gz" -mtime +$DAYS_OLD -exec rm -f {} \;
bye
EOF

# Check if the SFTP cleanup command was successful
if [ $? -eq 0 ]; then
    echo "✅ Remote old backups have been removed successfully."
else
    echo "❌ Failed to remove old remote backups."
    exit 1
fi

echo "Backup and cleanup process completed."