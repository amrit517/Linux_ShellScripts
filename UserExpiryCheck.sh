#!/bin/bash

# Check if 'chage' exists
if ! command -v chage &>/dev/null; then
    echo "Error: 'chage' command not found. Please install the 'passwd' package."
    exit 1
fi

echo "🔍 Checking password expiry for all users..."
echo

# Get users with UID >= 1000 (exclude system users like root, nobody)
USER_LIST=$(getent passwd | awk -F: '$3 >= 1000 { print $1 }')

for USER in $USER_LIST; do
    EXPIRY_DATE=$(chage -l "$USER" | grep "Password expires" | cut -d: -f2 | xargs)

    if [ "$EXPIRY_DATE" == "never" ]; then
        echo "🟢 $USER: Password never expires"
        continue
    fi

    # Convert expiry date to timestamp
    EXPIRY_TIMESTAMP=$(date -d "$EXPIRY_DATE" +%s 2>/dev/null)
    NOW=$(date +%s)

    if [ -z "$EXPIRY_TIMESTAMP" ]; then
        echo "⚠️  $USER: Unable to parse expiry date ($EXPIRY_DATE)"
        continue
    fi

    DAYS_LEFT=$(( (EXPIRY_TIMESTAMP - NOW) / 86400 ))

    if [ "$DAYS_LEFT" -lt 0 ]; then
        echo "🔴 $USER: Password expired $((-DAYS_LEFT)) day(s) ago ($EXPIRY_DATE)"
    elif [ "$DAYS_LEFT" -le 7 ]; then
        echo "🟠 $USER: Password expires in $DAYS_LEFT day(s) ($EXPIRY_DATE)"
    else
        echo "🟢 $USER: Password expires in $DAYS_LEFT day(s) ($EXPIRY_DATE)"
    fi
done
