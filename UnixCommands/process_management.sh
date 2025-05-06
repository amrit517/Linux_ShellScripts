ps
Example: ps aux
a – show processes for all users
u – display user-oriented format
x – show processes not attached to a terminal
Explanation: Lists all currently running processes on the system with detailed info like PID, user, CPU usage, and command.

top
Example: top
Explanation: Displays real-time system processes, CPU/memory usage, and allows sorting and process management.

htop
Example: htop
Explanation: Enhanced version of top with an interactive interface. Use arrow keys or mouse to navigate and manage processes.

kill
Example: kill -9 1234
-9 – sends SIGKILL (force kill signal)
Explanation: Sends a specified signal to terminate a process by PID. -9 forcefully stops the process.

killall
Example: killall firefox
Explanation: Terminates all processes with the name firefox.

bg
Example: bg %1
Explanation: Resumes a suspended job (like one paused with Ctrl+Z) in the background, allowing the terminal to be used for other tasks.

fg
Example: fg %1
Explanation: Brings a background or suspended job to the foreground, so you can interact with it directly.

jobs
Example: jobs
Explanation: Lists all background and suspended jobs in the current terminal session.

nice
Example: nice -n 10 ./script.sh
-n – specify the nice (priority) value
Explanation: Starts a process with a given priority. Higher numbers mean lower priority; 10 runs it more nicely (less demanding).

renice
Example: renice -n 5 -p 1234
-n – new nice value
-p – specify process ID
Explanation: Changes the priority of a running process. Lower nice values mean higher priority.

uptime
Example: uptime
Explanation: Shows how long the system has been running, number of users logged in, and average load over 1, 5, and 15 minutes.

time
Example: time ls
Explanation: Measures and displays how long the specified command (ls in this case) takes to run, including real (wall-clock), user, and system time.