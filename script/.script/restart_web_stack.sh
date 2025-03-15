#!/bin/bash
# Script to restart the LAMP or LAPP stack

echo "🔄 Restarting the web stack..."

# Ensure the script is run with sudo
if [[ $EUID -ne 0 ]]; then
    echo "⚠️  Please run this script with sudo or as root!"
    exit 1
fi

# Function to restart a service and check its status
restart_service() {
    local service=$1
    systemctl restart "$service"
    if systemctl is-active --quiet "$service"; then
        echo "✅ Successfully restarted $service."
    else
        echo "❌ Failed to restart $service!" >&2
        exit 1
    fi
}

# Always restart Apache
restart_service httpd

# Ask user which database to restart
echo "Which database would you like to restart?"
echo "1) MariaDB"
echo "2) PostgreSQL"
echo "3) Both"
echo "4) Skip database restart"
read -p "Enter your choice (1/2/3/4): " db_choice

case "$db_choice" in
    1) restart_service mariadb ;;
    2) restart_service postgresql ;;
    3) restart_service mariadb
       restart_service postgresql ;;
    4) echo "⏭️  Skipping database restart." ;;
    *) echo "⚠️  Invalid option! No database restarted." ;;
esac

echo "🚀 Web stack has been restarted successfully!"
