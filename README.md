# Network Config Backup Scripts

## Overview
Automated backup solution for Cisco and Huawei network device configurations.  
Used in production datacenter environments (Dialog Axiata IDC operations).

## Features
- Multi-device backup (Cisco, Huawei)
- Timestamped configuration files
- Backup logging with success/failure tracking
- Automatic cleanup of backups older than 90 days

## Requirements
- Linux server (Ubuntu/CentOS)
- SSH access to network devices
- `sshpass` (for password auth) or SSH keys

## Installation

```bash
# Install sshpass (if using password auth)
sudo apt-get install sshpass

# Create backup directory
sudo mkdir -p /backup/network_configs

# Copy script to /usr/local/bin
sudo cp backup-cisco.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/backup-cisco.sh

# Edit device list and credentials
nano /usr/local/bin/backup-cisco.sh
