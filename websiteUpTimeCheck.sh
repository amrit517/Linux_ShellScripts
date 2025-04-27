#!/bin/bash

# Function to check website uptime
check_website_uptime() {
    # URL of the website to check
    read -p "Enter the website URL (including http:// or https://): " website_url
    
    # Perform the curl request to check HTTP response
    http_response=$(curl -s -o /dev/null -w "%{http_code}" "$website_url")
    
    # Define a list of acceptable HTTP response codes (You can modify this list)
    # These codes generally indicate that the website or service is running.
    valid_responses="200 301 302 401 403 404 500"

    # Check if the response code is in the list of valid responses
    if [[ $valid_responses =~ (^|[[:space:]])"$http_response"($|[[:space:]]) ]]; then
        echo "✅ The website $website_url is up and running! (Response Code: $http_response)"
    else
        echo "❌ The website $website_url might be DOWN! (HTTP Response Code: $http_response)"
    fi
}

# Main function to execute the uptime check
main() {
    echo "======================================"
    echo "Website Uptime Checker"
    echo "======================================"
    
    check_website_uptime  # Call the function to check uptime
    
    echo "======================================"
    echo "Uptime Check Completed!"
}

# Call the main function
main
