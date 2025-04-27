#!/bin/bash

# List of packages to install
PACKAGES=(
    "curl"
    "git"
    "vim"
    "htop"
    "wget"
    "python3-pip"
    "docker"
)

# Function to check if a package is installed
is_package_installed() {
    rpm -q "$1" > /dev/null 2>&1
    return $?
}

# Function to install the required package
install_package() {
    PACKAGE=$1
    echo "Installing $PACKAGE..."

    # Update the package list
    sudo yum update -y    # or `sudo dnf update -y` for newer Fedora/RHEL versions

    # Install the package
    sudo yum install -y "$PACKAGE"    # or `sudo dnf install -y "$PACKAGE"`

    # Check if installation was successful
    if is_package_installed "$PACKAGE"; then
        echo "✅ $PACKAGE installed successfully."
    else
        echo "❌ Failed to install $PACKAGE."
    fi
}

# Main function
main() {
    echo "======================================"
    echo "Automated Software Installation Script"
    echo "======================================"
    echo "Starting the installation process..."

    # Loop over each package and install it
    for PACKAGE in "${PACKAGES[@]}"; do
        if is_package_installed "$PACKAGE"; then
            echo "✅ $PACKAGE is already installed."
        else
            install_package "$PACKAGE"
        fi
    done

    echo "Installation process completed!"
}

# Call the main function
main
