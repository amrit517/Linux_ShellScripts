#!/bin/bash

# Function to check basic internet connectivity
check_internet() {
    echo "Checking internet connectivity..."
    sudo ping -c 4 google.com > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "✅ Internet connectivity is working."
    else
        echo "❌ No internet connectivity."
    fi
}

# Function to check DNS resolution for a domain
check_dns_resolution() {
    echo "Checking DNS resolution for google.com..."
    nslookup google.com > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "✅ DNS resolution is working."
    else
        echo "❌ DNS resolution failed."
    fi
}

# Function to check connectivity to a specific IP address or domain
check_connectivity() {
    read -p "Enter an IP address or domain to check connectivity: " address
    echo "Checking connectivity to $address..."
    ping -c 4 "$address" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "✅ Successfully connected to $address."
    else
        echo "❌ Failed to connect to $address."
    fi
}

# Function to check HTTP/HTTPS access to a website
check_http_access() {
    read -p "Enter a website (http:// or https://) to check: " website
    echo "Checking HTTP/HTTPS access to $website..."
    curl -I "$website" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "✅ HTTP/HTTPS access to $website is working."
    else
        echo "❌ Failed to access $website."
    fi
}

# Function to check if a specific port is open on a host
check_port() {
    read -p "Enter an IP address or domain to check port connectivity: " address
    read -p "Enter the port number to check: " port
    echo "Checking if port $port is open on $address..."
    
    # Using nc (Netcat) to check if port is open
    nc -zv "$address" "$port" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "✅ Port $port is open on $address."
    else
        echo "❌ Port $port is closed on $address."
    fi
}

# Main function to execute all checks
main() {
    echo "======================================"
    echo "Network Connectivity Checker Script"
    echo "======================================"
    
    check_internet
    check_dns_resolution
    check_connectivity
    check_http_access
    check_port  # Check for port connectivity
    
    echo "======================================"
    echo "Network Connectivity Check Completed!"
}

# Call the main function
main
