uname
Example: uname -a
-a – print all system information
Explanation: Displays system information like kernel name, version, and architecture.

hostname
Example: hostname
Explanation: Displays the system’s hostname. Can also be used to set it temporarily: hostname newname.

uptime (Repeated)
Example: uptime
Explanation: Shows how long the system has been running along with the average system load.

dmesg
Example: dmesg | less
Explanation: Prints kernel messages, typically boot and hardware-related. Piping to less makes it scrollable.

free
Example: free -h
-h – human-readable output (MB/GB)
Explanation: Displays system memory usage: total, used, free, and swap.

top (Repeated)
Example: top
Explanation: Real-time display of CPU, memory, and process usage.

lsusb
Example: lsusb
Explanation: Lists all USB buses and the devices connected to them. Useful for verifying hardware like USB drives, keyboards, etc.

lspci
Example: lspci
Explanation: Lists PCI devices (graphics cards, network adapters, etc.) on the system.

lshw
Example: sudo lshw | less
Explanation: Displays detailed hardware information like CPU, memory, disks, and more. Use sudo for complete output. Piped to less for readability.