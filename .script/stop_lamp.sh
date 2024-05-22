#!/bin/bash
# This script will stop the lamp stack
echo "Stopping the LAMP stack..."

# Stop the Apache web server
sudo systemctl stop httpd

# Stop the MariaDB database
sudo systemctl stop mariadb

# check the status of the LAMP stack
sudo systemctl status httpd
sudo systemctl status mariadb

echo ""
echo "The LAMP stack has been stopped."
