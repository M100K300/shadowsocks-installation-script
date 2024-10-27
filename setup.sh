Shadosocks script install 

#!/bin/bash

# Update package lists and install Shadowsocks
sudo apt update
sudo apt -y install shadowsocks-libev

# Create configuration file for Shadowsocks
cat <<EOT > /etc/shadowsocks-libev/config.json
{
    "server_port": 443,
    "local_port": 443,
    "password": "your-password"
    "timeout": 600,
    "method": "aes-256-gcm"
}
EOT

# Start the Shadowsocks server in the background and log output
nohup ss-server -c /etc/shadowsocks-libev/config.json >> /var/log/shadowsocks.log &

sudo ufw allow 443

# Output success message
echo "Shadowsocks server has been started in the background."
