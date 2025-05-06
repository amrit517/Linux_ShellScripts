#!/bin/bash

# Directory to clean up
TARGET_DIR="/path/to/your/directory"

if [ ! -d "$TARGET_DIR" ]; then
    echo "❌ Directory does not exist: $TARGET_DIR"
    exit 1
fi

find "$TARGET_DIR" -type f -mtime +7 -exec rm -f {} \;

if [ $? -eq 0 ]; then
    echo "✅ Cleanup completed successfully! Files older than 7 days have been deleted."
else
    echo "❌ Cleanup failed!"
fi
