#!/bin/bash
# This script will start the lamp stack

echo "Starting the LAMP stack..."

# Start the Apache web server
sudo systemctl start httpd

# Start the MariaDB database
sudo systemctl start mariadb

# check the status of the LAMP stack
sudo systemctl status httpd
sudo systemctl status mariadb

echo ""
echo "The LAMP stack has been started."

