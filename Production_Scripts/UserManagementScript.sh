#!/bin/bash

add_user() {
    read -p "Enter username to add: " USERNAME
    sudo useradd -m $USERNAME
    sudo passwd $USERNAME
    echo "✅ User '$USERNAME' added successfully!"
}


delete_user() {
    read -p "Enter username to delete: " USERNAME
    sudo userdel -r $USERNAME
    echo "✅ User '$USERNAME' deleted successfully!"
}

change_password() {
    read -p "Enter username to change password: " USERNAME
    sudo passwd $USERNAME
    echo "✅ Password for user '$USERNAME' changed successfully!"
}

list_users() {
    echo "==================== List of Users ===================="
    cut -d: -f1 /etc/passwd
    echo "========================================================"
}

# Function to lock a user's account
lock_user() {
    read -p "Enter username to lock: " USERNAME
    sudo passwd -l $USERNAME
    echo "✅ User '$USERNAME' account locked!"
}

# Function to unlock a user's account
unlock_user() {
    read -p "Enter username to unlock: " USERNAME
    sudo passwd -u $USERNAME
    echo "✅ User '$USERNAME' account unlocked!"
}


check_user() {
    read -p "Enter username to check details: " USERNAME
    id $USERNAME
    echo "==================== User Details ====================="
    sudo grep $USERNAME /etc/passwd
    echo "========================================================"
}

while true; do
    echo "==================== User Management Script =================="
    echo "1. Add a new user"
    echo "2. Delete a user"
    echo "3. Change user password"
    echo "4. List all users"
    echo "5. Lock a user account"
    echo "6. Unlock a user account"
    echo "7. Check user details"
    echo "8. Exit"
    read -p "Choose an option [1-8]: " option

    case $option in
        1) add_user ;;
        2) delete_user ;;
        3) change_password ;;
        4) list_users ;;
        5) lock_user ;;
        6) unlock_user ;;
        7) check_user ;;
        8) echo "Exiting. Goodbye!"; exit 0 ;;
        *) echo "❌ Invalid option. Please choose a valid option." ;;
    esac
done
