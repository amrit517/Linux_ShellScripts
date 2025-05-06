#!/bin/bash

# Usage:
# ./db_backup.sh mysql|postgres|oracle db_name user password backup_dir [host] [port] [oracle_sid]

set -e  # Exit on any error

# --- Validate minimum args ---
if [ "$#" -lt 5 ]; then
    echo "Usage: $0 mysql|postgres|oracle db_name user password backup_dir [host] [port] [oracle_sid]"
    exit 1
fi

ENGINE=$1
DB_NAME=$2
DB_USER=$3
DB_PASS=$4
BACKUP_DIR=$5
HOST=${6:-localhost}
PORT=$7
ORACLE_SID_INPUT=$8

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
FILENAME="${DB_NAME}_${TIMESTAMP}"
FULL_PATH="${BACKUP_DIR}/${FILENAME}.sql"
GZ_PATH="${FULL_PATH}.gz"

mkdir -p "$BACKUP_DIR"

# --- Validate engine ---
if [[ "$ENGINE" != "mysql" && "$ENGINE" != "postgres" && "$ENGINE" != "oracle" ]]; then
    echo "Error: Unsupported engine '$ENGINE'. Use 'mysql', 'postgres', or 'oracle'."
    exit 1
fi

# --- Command checks ---
check_cmd() {
    command -v "$1" >/dev/null || { echo "$1 not found."; exit 1; }
}

check_cmd gzip

if [ "$ENGINE" == "mysql" ]; then
    check_cmd mysqldump
    PORT=${PORT:-3306}
    echo "Backing up MySQL database '$DB_NAME'..."
    mysqldump -h "$HOST" -P "$PORT" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$FULL_PATH"

elif [ "$ENGINE" == "postgres" ]; then
    check_cmd pg_dump
    PORT=${PORT:-5432}
    echo "Backing up PostgreSQL database '$DB_NAME'..."
    PGPASSWORD="$DB_PASS" pg_dump -h "$HOST" -p "$PORT" -U "$DB_USER" -F p "$DB_NAME" > "$FULL_PATH"

elif [ "$ENGINE" == "oracle" ]; then
    check_cmd exp
    ORACLE_SID=${ORACLE_SID_INPUT:-$ORACLE_SID}
    if [ -z "$ORACLE_SID" ]; then
        echo "ORACLE_SID not set. Provide as 8th argument or export ORACLE_SID."
        exit 1
    fi

    export ORACLE_SID
    EXP_FILE="${BACKUP_DIR}/${FILENAME}.dmp"

    echo "Backing up Oracle 11g database '$DB_NAME' using SID '$ORACLE_SID'..."
    exp "$DB_USER/$DB_PASS@$ORACLE_SID" file="$EXP_FILE" log="${EXP_FILE%.dmp}.log" owner="$DB_USER"

    echo "Compressing Oracle export..."
    gzip "$EXP_FILE"
    echo "✅ Oracle backup complete: ${EXP_FILE}.gz"
    exit 0
fi

# --- Compress SQL file ---
gzip "$FULL_PATH"
echo "✅ Backup complete: $GZ_PATH"
