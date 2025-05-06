#!/bin/bash

# Function to encrypt the file
encrypt_file() {
    read -p "Enter the path to the file to encrypt: " FILE_PATH
    read -sp "Enter encryption password: " PASSWORD
    echo

    # Check if the file exists
    if [[ ! -f "$FILE_PATH" ]]; then
        echo "❌ File does not exist!"
        exit 1
    fi

    # Generate encrypted file name
    ENCRYPTED_FILE="${FILE_PATH}.enc"

    # Encrypt the file using AES-256-CBC (Cipher Block Chaining mode)
    openssl enc -aes-256-cbc -salt -in "$FILE_PATH" -out "$ENCRYPTED_FILE" -pass pass:"$PASSWORD"

    # Check if the encryption was successful
    if [[ $? -eq 0 ]]; then
        echo "✅ File encrypted successfully! Encrypted file: $ENCRYPTED_FILE"
    else
        echo "❌ Encryption failed!"
        exit 1
    fi
}

# Function to decrypt the file
decrypt_file() {
    # Prompt for file path and decryption password
    read -p "Enter the path to the encrypted file: " ENCRYPTED_FILE
    read -sp "Enter decryption password: " PASSWORD
    echo

    # Check if the encrypted file exists
    if [[ ! -f "$ENCRYPTED_FILE" ]]; then
        echo "❌ Encrypted file does not exist!"
        exit 1
    fi

    DECRYPTED_FILE="${ENCRYPTED_FILE%.enc}"

    # Decrypt the file using AES-256-CBC
    openssl enc -d -aes-256-cbc -in "$ENCRYPTED_FILE" -out "$DECRYPTED_FILE" -pass pass:"$PASSWORD"

    # Check if the decryption was successful
    if [[ $? -eq 0 ]]; then
        echo "✅ File decrypted successfully! Decrypted file: $DECRYPTED_FILE"
    else
        echo "❌ Decryption failed!"
        exit 1
    fi
}

# Main function
main() {
    echo "======================================"
    echo "File Encryption and Decryption Script"
    echo "======================================"
    echo "Choose an option:"
    echo "1. Encrypt a file"
    echo "2. Decrypt a file"
    echo "3. Exit"
    read -p "Enter your choice [1/2/3]: " CHOICE

    case $CHOICE in
        1)
            encrypt_file
            ;;
        2)
            decrypt_file
            ;;
        3)
            echo "Exiting script. Goodbye!"
            exit 0
            ;;
        *)
            echo "❌ Invalid choice. Please choose 1, 2, or 3."
            ;;
    esac
}

main
