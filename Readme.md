### Set Up Email Notifications

Ubuntu comes with the mail command (part of mailutils) which can be used to send email notifications. First, you need to install mailutils:
```
sudo apt-get install mailutils
```

### Configure Email Settings
Ensure that your system can send emails by setting up a simple Mail Transfer Agent (MTA). postfix is commonly used:

```
sudo apt-get install postfix
```

/usr/local/bin/clamav_scan_notify.sh
sudo chmod +x /usr/local/bin/clamav_scan_notify.sh
sudo crontab -e
0 3 * * * /usr/local/bin/clamav_scan_notify.sh


/usr/local/bin/snort_notify.sh
sudo chmod +x /usr/local/bin/snort_notify.sh
sudo crontab -e
0 * * * * /usr/local/bin/snort_notify.sh