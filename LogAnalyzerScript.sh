#!/bin/bash

check_log_file() {
    if [[ ! -f "$LOG_FILE" ]]; then
        echo "❌ Log file '$LOG_FILE' does not exist!"
        exit 1
    fi
}

search_for_errors() {
    echo "Searching for errors in the log file..."
    grep -i "error" "$LOG_FILE" > "$OUTPUT_DIR/errors.txt"
    if [[ $? -eq 0 ]]; then
        echo "✅ Errors found and saved in 'errors.txt'."
    else
        echo "No errors found."
    fi
}

search_for_warnings() {
    echo "Searching for warnings in the log file..."
    grep -i "warning" "$LOG_FILE" > "$OUTPUT_DIR/warnings.txt"
    if [[ $? -eq 0 ]]; then
        echo "✅ Warnings found and saved in 'warnings.txt'."
    else
        echo "No warnings found."
    fi
}

display_summary() {
    echo "===================================="
    echo "Log File Summary:"
    echo "===================================="
    echo "Total lines in the log file: $(wc -l < "$LOG_FILE")"
    echo "Total errors found: $(grep -ic "error" "$LOG_FILE")"
    echo "Total warnings found: $(grep -ic "warning" "$LOG_FILE")"
    echo "===================================="
}

# Function to analyze specific user logs or system logs
analyze_log() {
    echo "===================================="
    echo "Analyzing the log file: $LOG_FILE"
    echo "===================================="

    # Search for errors and warnings
    search_for_errors
    search_for_warnings

    # Display summary of log
    display_summary

    echo "===================================="
    echo "Last 10 lines of the log file:"
    tail -n 10 "$LOG_FILE"
    echo "===================================="
}

# Main entry point
main() {
    # User input for log file and output directory
    read -p "Enter the path to the log file: " LOG_FILE
    read -p "Enter the output directory to save results: " OUTPUT_DIR

    # Ensure the output directory exists
    mkdir -p "$OUTPUT_DIR"

    # Check if the log file exists before proceeding
    check_log_file

    # Run the log analysis
    analyze_log
}

# Call the main function to start the script
main
