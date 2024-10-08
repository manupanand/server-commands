sudo freshclam

sudo clamscan -r /

sudo apt install snort-rules-default

sudo snort -A console -q -c /etc/snort/snort.conf -i eth0

sudo less /var/log/snort/alert

#!/bin/bash

# Update ClamAV
sudo /usr/bin/freshclam --quiet

# Run ClamAV Scan
sudo /usr/bin/clamscan -r /home --log=/var/log/clamav/daily_scan.log --quiet

# Run Snort
sudo /usr/sbin/snort -A console -q -c /etc/snort/snort.conf -i wlxf0a7319fea00
