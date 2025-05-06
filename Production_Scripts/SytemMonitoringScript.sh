#!/bin/bash

# Set the thresholds for CPU, Memory, and Disk usage (in percentage)
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

HOSTNAME=$(hostname)
DATE=$(date "+%Y-%m-%d %H:%M:%S")
UPTIME=$(uptime -p)
USER_COUNT=$(who -q | head -n 1)
CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
MEMORY_USAGE=$(free -m | grep Mem | awk '{print $3 "MB / " $2 "MB (" $3/$2*100.0 "%)"}')
MEMORY_PERCENTAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
DISK_USAGE=$(df -h | grep "^/dev" | awk '{print $1 " " $3 " / " $2 " (" $5 ")"}')
DISK_PERCENTAGE=$(df | grep "/dev" | awk '{print $5}' | sed 's/%//g')
TOP_PROCESSES=$(ps aux --sort=-%cpu | head -n 6)

# Output the information
echo "==================== SYSTEM MONITORING ===================="
echo "Hostname: $HOSTNAME"
echo "Date: $DATE"
echo "Uptime: $UPTIME"
echo "Active Users: $USER_COUNT"
echo "CPU Load: $CPU_LOAD%"
echo "Memory Usage: $MEMORY_USAGE"
echo "Disk Usage: $DISK_USAGE"
echo ""
echo "==================== TOP PROCESSES ====================="
echo "$TOP_PROCESSES"
echo "==========================================================="

# Check if CPU usage exceeds threshold
if (( $(echo "$CPU_LOAD > $CPU_THRESHOLD" | bc -l) )); then
    echo "❗ ALERT: CPU usage is high! Current CPU Load: $CPU_LOAD%"
    # Optional: Send email or Slack notification here
else
    echo "✅ CPU usage is within safe limits."
fi

# Check if Memory usage exceeds threshold
if (( $(echo "$MEMORY_PERCENTAGE > $MEMORY_THRESHOLD" | bc -l) )); then
    echo "❗ ALERT: Memory usage is high! Current Memory Usage: $MEMORY_USAGE"

else
    echo "✅ Memory usage is within safe limits."
fi

# Check if Disk usage exceeds threshold
if (( $DISK_PERCENTAGE > $DISK_THRESHOLD )); then
    echo "❗ ALERT: Disk usage is high! Current Disk Usage: $DISK_USAGE"
else
    echo "✅ Disk usage is within safe limits."
fi