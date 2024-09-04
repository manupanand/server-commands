sudo freshclam

sudo clamscan -r /

sudo apt install snort-rules-default

sudo snort -A console -q -c /etc/snort/snort.conf -i eth0

sudo less /var/log/snort/alert

#!/bin/bash

# Update ClamAV
/usr/bin/freshclam --quiet

# Run ClamAV Scan
/usr/bin/clamscan -r /home --log=/var/log/clamav/daily_scan.log --quiet

# Run Snort
/usr/bin/snort -A console -q -c /etc/snort/snort.conf -i eth0