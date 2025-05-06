ifconfig (Deprecated)
Example: ifconfig eth0
Explanation: Displays or configures the network settings of interface eth0. Not commonly used in modern systems (replaced by ip).

ip
Example: ip a or ip addr
a or addr – show all IP addresses and interfaces
Explanation: Displays the IP address, MAC address, and status of all network interfaces. More powerful and modern than ifconfig.

ping
Example: ping google.com
Explanation: Sends ICMP echo requests to google.com to test if the network connection is working. Continues until interrupted with Ctrl+C.

netstat (Deprecated)
Example: netstat -tuln
-t – TCP connections
-u – UDP connections
-l – listening sockets
-n – numeric addresses (no DNS resolution)
Explanation: Displays network connections, routing tables, interface stats. Replaced by ss in modern systems.

ss
Example: ss -tuln
Same options as netstat: shows TCP/UDP listening sockets without DNS lookup.
Explanation: A faster, more modern replacement for netstat. Used for inspecting socket connections.

traceroute
Example: traceroute google.com
Explanation: Shows the path (hops) that packets take from your machine to a remote server. Useful for diagnosing routing issues.

nslookup
Example: nslookup example.com
Explanation: Queries DNS records for a domain. Interactive mode also available. Being replaced by dig.

dig
Example: dig example.com
Explanation: A powerful DNS lookup tool that returns detailed information about domain records. Preferred over nslookup.

wget
Example: wget https://example.com/file.zip
Explanation: Downloads files from the web via HTTP, HTTPS, or FTP. Works in the background (non-interactive).

curl
Example: curl -O https://example.com/file.zip
-O – save with original filename
Explanation: Transfers data using various protocols (HTTP, FTP, etc.). More flexible than wget for APIs and scripting.

scp
Example: scp file.txt user@remote:/home/user/
Explanation: Securely copies files between local and remote systems using SSH. Syntax similar to cp.

ssh
Example: ssh user@remote_host
Explanation: Establishes a secure terminal session with a remote machine over SSH.

ftp (Insecure; Deprecated)
Example: ftp ftp.example.com
Explanation: Connects to FTP servers for file transfer. Not encrypted—avoid in favor of sftp or scp.