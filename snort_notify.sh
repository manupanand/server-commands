#!/bin/bash

LOGFILE="/var/log/snort/alert"
RECIPIENT="your_email@example.com"

# Run Snort
/usr/bin/snort -A console -q -c /etc/snort/snort.conf -i eth0 > $LOGFILE

# Check if the log file contains alerts
if [ -s $LOGFILE ]; then
    # If the log file is not empty, send an email notification
    mail -s "ALERT: Snort Detected Suspicious Activity!" $RECIPIENT < $LOGFILE
else
    echo "No suspicious activity detected by Snort." | mail -s "Snort Report: No Activity" $RECIPIENT
fi
