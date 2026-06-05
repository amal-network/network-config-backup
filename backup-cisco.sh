#!/bin/bash
# Automated Network Configuration Backup Script
# Author: Amal Dharmapala
# Purpose: Backup Cisco & Huawei device configs automatically

# Configuration
BACKUP_DIR="/backup/network_configs"
DATE=$(date +%Y-%m-%d)
LOG_FILE="$BACKUP_DIR/backup_log_$DATE.txt"

# List of devices (IP or hostname)
DEVICES=(
    "192.168.10.1"   # Core Switch 1
    "192.168.10.2"   # Core Switch 2
    "192.168.20.1"   # Distribution Router
)

# Create backup directory if not exists
mkdir -p $BACKUP_DIR

# Start logging
echo "Backup started at $(date)" >> $LOG_FILE

# Backup each device
for DEVICE in "${DEVICES[@]}"; do
    echo "Backing up $DEVICE..." >> $LOG_FILE
    
    # SSH to device and capture running config
    # Note: Replace with actual credentials method (SSH keys recommended)
    sshpass -p 'your_password' ssh -o StrictHostKeyChecking=no admin@$DEVICE "show running-config" > $BACKUP_DIR/$DEVICE-$DATE.cfg 2>> $LOG_FILE
    
    if [ $? -eq 0 ]; then
        echo "SUCCESS: $DEVICE backup completed" >> $LOG_FILE
    else
        echo "FAILED: $DEVICE backup failed" >> $LOG_FILE
    fi
done

echo "Backup completed at $(date)" >> $LOG_FILE
echo "================================" >> $LOG_FILE

# Optional: Delete backups older than 90 days
find $BACKUP_DIR -name "*.cfg" -type f -mtime +90 -delete

echo "Old backups cleaned up" >> $LOG_FILE
