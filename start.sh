#!/bin/bash

# SET non-interactive for timezone
export DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/Asia/Kathmandu  /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# Install tmate and expect
apt-get update
apt-get install -y tmate expect

# Print SSH and Web (read-write) session links
echo "SSH access:"
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'

# Auto type to keep it alive
while true; do
    tmate -S /tmp/tmate.sock send-keys "echo alive && date" C-m
    sleep 300
done
