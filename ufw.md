If ufw is inactive and you want to enable it and configure some basic rules, you can follow these steps:
Enable UFW

To enable the UFW firewall, run:

bash

sudo ufw enable

Check UFW Status

After enabling, you can check the status again to ensure it's active:

bash

sudo ufw status verbose

Basic UFW Configuration

Here are some basic commands to configure UFW:

    Allow SSH (Port 22):

    bash

sudo ufw allow ssh

or

bash

sudo ufw allow 22/tcp

Allow HTTP (Port 80):

bash

sudo ufw allow http

or

bash

sudo ufw allow 80/tcp

Allow HTTPS (Port 443):

bash

sudo ufw allow https

or

bash

sudo ufw allow 443/tcp

Deny All Incoming Connections by Default:

bash

sudo ufw default deny incoming

Allow All Outgoing Connections by Default:

bash

    sudo ufw default allow outgoing

Example: Enabling and Configuring UFW

Here's a sequence of commands to enable UFW and set up some basic rules:

bash

sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw status verbose

Disabling UFW

If for some reason you need to disable UFW, you can do so with:

bash

sudo ufw disable

Detailed Example of Checking and Setting Rules

Let's go through an example to enable UFW and add some basic rules:

    Enable UFW:

    bash

sudo ufw enable

You might be prompted to confirm enabling UFW. Confirm the action.

Set Default Policies:

bash

sudo ufw default deny incoming
sudo ufw default allow outgoing

Allow SSH:

bash

sudo ufw allow ssh

Allow HTTP and HTTPS:

bash

sudo ufw allow http
sudo ufw allow https

Check Status:

bash

sudo ufw status verbose

Example output after enabling and adding rules:

plaintext

    Status: active

    To                         Action      From
    --                         ------      ----
    22/tcp                     ALLOW IN    Anywhere
    80/tcp                     ALLOW IN    Anywhere
    443/tcp                    ALLOW IN    Anywhere
    22/tcp (v6)                ALLOW IN    Anywhere (v6)
    80/tcp (v6)                ALLOW IN    Anywhere (v6)
    443/tcp (v6)               ALLOW IN    Anywhere (v6)

These steps should help you enable UFW and set up basic firewall rules on your system. If you have any specific requirements or additional rules you need help with, feel free to ask!


List UFW Status

To check if UFW is active and list all rules:

bash

sudo ufw status verbose

Detailed Status

To get a more detailed status including numbered rules:

bash

sudo ufw status numbered

List All Application Profiles

To list all available application profiles that UFW knows about:

bash

sudo ufw app list

Show Detailed Information About a Specific Application Profile

To show detailed information about a specific application profile:

bash

sudo ufw app info <application>

Replace <application> with the name of the application profile you're interested in.
Example Commands

Here are some examples of these commands in action:

    List UFW Status:

    bash

sudo ufw status verbose

Example output:

plaintext

Status: active

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW       Anywhere
80/tcp                     ALLOW       Anywhere
443/tcp                    ALLOW       Anywhere
22/tcp (v6)                ALLOW       Anywhere (v6)
80/tcp (v6)                ALLOW       Anywhere (v6)
443/tcp (v6)               ALLOW       Anywhere (v6)

Detailed Status with Numbered Rules:

bash

sudo ufw status numbered

Example output:

plaintext

Status: active

     To                         Action      From
     --                         ------      ----
[ 1] 22/tcp                     ALLOW IN    Anywhere
[ 2] 80/tcp                     ALLOW IN    Anywhere
[ 3] 443/tcp                    ALLOW IN    Anywhere
[ 4] 22/tcp (v6)                ALLOW IN    Anywhere (v6)
[ 5] 80/tcp (v6)                ALLOW IN    Anywhere (v6)
[ 6] 443/tcp (v6)               ALLOW IN    Anywhere (v6)

List All Application Profiles:

bash

sudo ufw app list

Example output:

plaintext

Available applications:
  OpenSSH
  Apache
  Apache Full
  Apache Secure
  Apache HTTP
  Samba

Show Detailed Information About a Specific Application Profile:

bash

sudo ufw app info OpenSSH

Example output:

plaintext

Profile: OpenSSH
Title: Secure shell server, an rshd replacement
Description: OpenSSH is a free implementation of the Secure Shell protocol.

Port:
  22/tcp
