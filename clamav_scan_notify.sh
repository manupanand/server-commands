#!/bin/bash

LOGFILE="/var/log/clamav/daily_scan.log"
RECIPIENT="your_email@example.com"

# Run ClamAV Scan
/usr/bin/clamscan -r /home --log=$LOGFILE --quiet

# Check if the log file contains "Infected files"
if grep -q "Infected files: 0" $LOGFILE; then
    echo "No threats found in the last ClamAV scan." | mail -s "ClamAV Scan Report: No Threats" $RECIPIENT
else
    # If threats are found, send an email notification
    mail -s "ALERT: ClamAV Scan Detected Threats!" $RECIPIENT < $LOGFILE
fi
