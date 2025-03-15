#!/bin/bash
# Script to stop the LAMP or LAPP stack

echo "🛑 Stopping the web stack..."

# Ensure the script is run with sudo
if [[ $EUID -ne 0 ]]; then
    echo "⚠️  Please run this script with sudo or as root!"
    exit 1
fi

# Function to stop a service and check its status
stop_service() {
    local service=$1
    if systemctl is-active --quiet "$service"; then
        systemctl stop "$service"
        if systemctl is-active --quiet "$service"; then
            echo "❌ Failed to stop $service!" >&2
            exit 1
        else
            echo "✅ Successfully stopped $service."
        fi
    else
        echo "⏸️  $service is already stopped."
    fi
}

# Always stop Apache
stop_service httpd

# Ask user which database to stop
echo "Which database would you like to stop?"
echo "1) MariaDB"
echo "2) PostgreSQL"
echo "3) Both"
echo "4) Skip database stop"
read -p "Enter your choice (1/2/3/4): " db_choice

case "$db_choice" in
    1) stop_service mariadb ;;
    2) stop_service postgresql ;;
    3) stop_service mariadb
       stop_service postgresql ;;
    4) echo "⏭️  Skipping database stop." ;;
    *) echo "⚠️  Invalid option! No database stopped." ;;
esac

echo "✅ Web stack has been stopped successfully!"
