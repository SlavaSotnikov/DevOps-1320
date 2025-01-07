#!/bin/bash

echo "=== OS Version ==="
lsb_release -a 2>/dev/null || cat /etc/os-release
echo

echo "=== Users with Bash Shell ==="
awk -F: '/bash$/ {print $1}' /etc/passwd
echo

echo "=== Open Ports ==="
sudo netstat -tuln | awk 'NR==1 || $6=="LISTEN" {print $0}'
