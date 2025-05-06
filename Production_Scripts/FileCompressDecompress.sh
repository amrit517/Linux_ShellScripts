#!/bin/bash

# Usage:
#   ./gzip_tar_tool.sh compress /path/to/source output_name
#   ./gzip_tar_tool.sh decompress archive.tar.gz /path/to/extract

ACTION=$1
SOURCE=$2
DESTINATION=$3

compress() {
    if [ ! -e "$SOURCE" ]; then
        echo "Source file or directory not found!"
        exit 1
    fi

    tar -czf "${DESTINATION}.tar.gz" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"
    echo "Compressed '$SOURCE' into '${DESTINATION}.tar.gz'"
}

decompress() {
    if [ ! -f "$SOURCE" ]; then
        echo "Archive file not found!"
        exit 1
    fi

    mkdir -p "$DESTINATION"
    tar -xzf "$SOURCE" -C "$DESTINATION"
    echo "Decompressed '$SOURCE' into '$DESTINATION'"
}

if [ "$ACTION" == "compress" ]; then
    compress
elif [ "$ACTION" == "decompress" ]; then
    decompress
else
    echo "Usage:"
    echo "  $0 compress /path/to/file_or_dir output_name"
    echo "  $0 decompress archive.tar.gz /path/to/extract"
    exit 1
fi
