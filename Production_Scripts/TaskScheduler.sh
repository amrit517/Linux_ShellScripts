#!/bin/bash

# =================== Functions ===================

# Function to validate cron schedule
validate_cron() {
    schedule="$1"
    
    # Check if it has exactly 5 fields
    field_count=$(echo "$schedule" | awk '{print NF}')
    if [ "$field_count" -ne 5 ]; then
        echo "❗ Invalid format! CRON must have exactly 5 fields."
        return 1
    fi

    # Split fields
    minute=$(echo "$schedule" | awk '{print $1}')
    hour=$(echo "$schedule" | awk '{print $2}')
    day_of_month=$(echo "$schedule" | awk '{print $3}')
    month=$(echo "$schedule" | awk '{print $4}')
    day_of_week=$(echo "$schedule" | awk '{print $5}')

    # More flexible regex for cron fields
    valid_field_regex='^(\*|\*/[0-9]+|[0-9]+|([0-9]+-[0-9]+)(/[0-9]+)?)(,(\*|\*/[0-9]+|[0-9]+|([0-9]+-[0-9]+)(/[0-9]+)?))*$'

    # Validate each field
    for field in "$minute" "$hour" "$day_of_month" "$month" "$day_of_week"; do
        if ! [[ $field =~ $valid_field_regex ]]; then
            echo "❗ Invalid field: '$field'. Please check your cron expression."
            return 1
        fi
    done

    # Optional: Basic range checking for numeric fields
    check_range() {
        field_value="$1"
        min="$2"
        max="$3"
        if [[ "$field_value" =~ ^[0-9]+$ ]]; then
            if (( field_value < min || field_value > max )); then
                echo "❗ Value '$field_value' out of range ($min-$max)."
                return 1
            fi
        fi
        return 0
    }

    check_range "$minute" 0 59 || return 1
    check_range "$hour" 0 23 || return 1
    check_range "$day_of_month" 1 31 || return 1
    check_range "$month" 1 12 || return 1
    check_range "$day_of_week" 0 7 || return 1

    return 0
}

# Function to add new cron jobs (multiple support)
add_task() {
    echo "📋 Cron Format Help:"
    echo "-----------------------------"
    echo "Minute (0-59)"
    echo "Hour (0-23)"
    echo "Day of Month (1-31)"
    echo "Month (1-12)"
    echo "Day of Week (0-6, Sunday=0)"
    echo "Example: */5 * * * *  -> Every 5 minutes"
    echo "-----------------------------"

    while true; do
        echo "Enter the schedule time in CRON format:"
        read schedule

        validate_cron "$schedule"
        if [ $? -eq 0 ]; then
            echo "Enter the command to schedule:"
            read command

            # Add to crontab
            (crontab -l 2>/dev/null; echo "$schedule $command") | crontab -
            echo "✅ Task scheduled successfully!"
        else
            echo "❗ Please enter a valid CRON expression!"
            continue
        fi

        echo "➕ Do you want to add another task? (y/n)"
        read add_more
        if [[ "$add_more" != "y" && "$add_more" != "Y" ]]; then
            break
        fi
    done
}

# Function to list all cron jobs
list_tasks() {
    echo "📋 Listing all scheduled tasks:"
    echo "---------------------------------"
    crontab -l 2>/dev/null || echo "No tasks scheduled."
    echo "---------------------------------"
}

# Function to remove a specific cron job
remove_task() {
    list_tasks
    echo ""
    echo "Enter a keyword to search and remove the task (e.g., part of the command):"
    read keyword
    if [ -z "$keyword" ]; then
        echo "❗ No keyword entered. Returning to menu."
        return
    fi

    crontab -l | grep -v "$keyword" | crontab -
    echo "🗑️ Task(s) containing '$keyword' have been removed!"
}

# Function to display menu
show_menu() {
    echo "======================================"
    echo "🛠️  Simple Task Scheduler"
    echo "======================================"
    echo "1. ➕ Add New Scheduled Task"
    echo "2. 📋 List All Scheduled Tasks"
    echo "3. 🗑️  Remove Scheduled Task"
    echo "4. 🚪 Exit"
    echo "======================================"
    echo -n "Choose an option [1-4]: "
}

# =================== Main ===================
while true; do
    show_menu
    read option
    case $option in
        1) add_task ;;
        2) list_tasks ;;
        3) remove_task ;;
        4) echo "👋 Exiting Task Scheduler."; exit 0 ;;
        *) echo "❗ Invalid option. Please choose between 1 and 4." ;;
    esac
done
