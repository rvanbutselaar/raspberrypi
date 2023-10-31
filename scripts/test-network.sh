#!/bin/bash
#
# echo '*/5 * * * * root /data/test-network.sh >> /var/log/test-network.log 2>&1' > /etc/cron.d/test-network
#

# Function to print datetime
print_datetime() {
    current_datetime=$(date "+%Y-%m-%d %H:%M:%S")
    echo "--------------------------------------"
    echo "Current datetime: $current_datetime"
    echo "--------------------------------------"
}

# Function to reboot the server
reboot_server() {
    echo "Rebooting the server..."
    sudo reboot
}

# Function to restart the network stack
restart_network() {
    echo "Restarting the network stack..."
    sudo systemctl restart networking
}

# Function to test ping
test_ping() {
    local domain="$1"
    echo "Testing ping for $domain..."
    if ping -c 4 "$domain"; then
        echo "Ping test for $domain complete."
    else
        echo "Ping test for $domain failed."
        restart_network
        exit 1
    fi
}

# Function to test dig
test_dig() {
    local domain="$1"
    echo "Testing dig for $domain..."
    if dig -4 +short "$domain"; then
        echo "Dig test for $domain complete."
    else
        echo "Dig test for $domain failed."
        restart_network
        exit 1
    fi
}

# Print datetime
print_datetime

# Test ping
test_ping 8.8.8.8

# Test dig
test_dig www.google.nl
