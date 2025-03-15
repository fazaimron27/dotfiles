#!/bin/bash
# Script to start the LAMP or LAPP stack

echo "🔄 Starting the web stack..."

# Ensure the script is run with sudo
if [[ $EUID -ne 0 ]]; then
    echo "⚠️  Please run this script with sudo or as root!"
    exit 1
fi

# Function to start a service and check its status
start_service() {
    local service=$1
    if systemctl is-active --quiet "$service"; then
        echo "✅ $service is already running."
    else
        systemctl start "$service"
        if systemctl is-active --quiet "$service"; then
            echo "✅ Successfully started $service."
        else
            echo "❌ Failed to start $service!" >&2
            exit 1
        fi
    fi
}

# Always start Apache
start_service httpd

# Ask user for database choice
echo "Which database would you like to start?"
echo "1) MariaDB"
echo "2) PostgreSQL"
echo "3) Both"
echo "4) Skip database"
read -p "Enter your choice (1/2/3/4): " db_choice

case "$db_choice" in
    1) start_service mariadb ;;
    2) start_service postgresql ;;
    3) start_service mariadb
       start_service postgresql ;;
    4) echo "⏭️  Skipping database startup." ;;
    *) echo "⚠️  Invalid option! No database started." ;;
esac

echo "🚀 Web stack is now running successfully!"
