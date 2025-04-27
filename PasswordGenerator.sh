#!/bin/bash

# Function to generate a password
generate_password() {
    local LENGTH=$1
    local CHARSET=""

    local LOWERCASE="abcdefghijklmnopqrstuvwxyz"
    local UPPERCASE="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local DIGITS="0123456789"
    local SYMBOLS="!@#$%^&*()_+-=[]{}|;:,.<>?/~"


    CHARSET="$LOWERCASE$UPPERCASE$DIGITS$SYMBOLS"

    PASSWORD=$(cat /dev/urandom | tr -dc "$CHARSET" | fold -w $LENGTH | head -n 1)

    echo "$PASSWORD"
}

validate_input() {
    local LENGTH=$1
    if [[ ! "$LENGTH" =~ ^[0-9]+$ ]] || [ "$LENGTH" -lt 8 ]; then
        echo "❌ Invalid input! Please enter a number greater than or equal to 8."
        exit 1
    fi
}

# Main function
main() {

    read -p "Enter the desired password length (minimum 8 characters): " LENGTH

    validate_input $LENGTH

    # Generate and display the password
    PASSWORD=$(generate_password $LENGTH)
    echo "✅ Generated Password: $PASSWORD"
}

main
