Using systemctl (Systemd)

Start a service:
Example: sudo systemctl start apache2
Explanation: Starts the apache2 service.

Stop a service:
Example: sudo systemctl stop apache2
Explanation: Stops the service.

Restart a service:
Example: sudo systemctl restart apache2
Explanation: Restarts the service.

Enable a service at boot:
Example: sudo systemctl enable apache2
Explanation: Configures service to start automatically at boot.

Disable service from auto-starting:
Example: sudo systemctl disable apache2
Explanation: Disables autostart on boot.

Check service status:
Example: sudo systemctl status apache2
Explanation: Displays whether service is running, stopped, or failed, along with logs.

Using service (older SysVinit)

Start a service:
Example: sudo service apache2 start
Explanation: Starts the service using legacy method.

Stop a service:
Example: sudo service apache2 stop
Explanation: Stops the service.

Restart a service:
Example: sudo service apache2 restart
Explanation: Restarts it.

Check service status:
Example: sudo service apache2 status
Explanation: Shows current status of the service.