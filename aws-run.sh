#!/bin/bash
# Set the password for the "ec2-user"
echo "ec2-user:YourSecurePassword" | sudo chpasswd

# Enable password authentication in SSH
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config

# Ensure UsePAM is enabled
echo "UsePAM yes" | sudo tee -a /etc/ssh/sshd_config

# Restart SSH service
sudo systemctl restart sshd


#!/bin/bash

# Set the password for "ec2-user" (USE WITH CAUTION)
echo "ec2-user:YourSecurePassword" | sudo chpasswd

# Enable password authentication in SSH
sudo sed -i 's/^#\?\(PasswordAuthentication\) no/\1 yes/' /etc/ssh/sshd_config
sudo sed -i 's/^#\?\(ChallengeResponseAuthentication\) no/\1 yes/' /etc/ssh/sshd_config

# Ensure UsePAM is enabled (modify instead of appending)
sudo sed -i 's/^#\?\(UsePAM\) no/\1 yes/' /etc/ssh/sshd_config

# Restart SSH service to apply changes
sudo systemctl restart sshd
