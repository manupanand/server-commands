#!/bin/bash

# Define log file
LOG_FILE="/var/log/startup_script.log"
sudo touch $LOG_FILE
sudo chmod 644 $LOG_FILE  

# Redirect stdout and stderr to log file
exec &>> $LOG_FILE

echo "Starting script execution at $(date)"

# Add a delay to ensure IAM role is applied
echo "Waiting for IAM role to be applied..."
sleep 120  # Wait for 30 seconds before proceeding



# Install and start rsyslog
sudo dnf install -y rsyslog $LOG_FILE
if [ $? -ne 0 ]; then
    echo "Error: Failed to install rsyslog."
    exit 1
fi

sudo systemctl enable rsyslog
sudo systemctl start rsyslog
sudo systemctl daemon-reload

# Set password for ec2-user (Replace 'YourSecurePassword' with a strong password)
echo "ec2-user:YourSecurePassword" | sudo chpasswd
if [ $? -ne 0 ]; then
    echo "Error: Failed to set password for ec2-user."
    exit 1
fi

# Enable password authentication in SSH
sudo sed -i 's/^#PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config $LOG_FILE
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config $LOG_FILE
sudo sed -i 's/^#ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config $LOG_FILE
sudo sed -i 's/^ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config $LOG_FILE
sudo sed -i 's/^PermitEmptyPasswords yes/PermitEmptyPasswords no/' /etc/ssh/sshd_config $LOG_FILE
sudo sed -i 's/^#UsePAM yes/UsePAM yes/' /etc/ssh/sshd_config $LOG_FILE

# Ensure UsePAM is explicitly enabled
echo "UsePAM yes" | sudo tee -a /etc/ssh/sshd_config 

# Allow password authentication in cloud-init
sudo sed -i 's/.*disable_root: true/disable_root: false/' /etc/cloud/cloud.cfg $LOG_FILE
sudo sed -i 's/.*ssh_pwauth: false/ssh_pwauth: true/' /etc/cloud/cloud.cfg $LOG_FILE
echo "Updated cloud-init configuration to allow password authentication."

# Restart cloud-init to apply changes
sudo cloud-init clean $LOG_FILE
sudo systemctl restart cloud-init $LOG_FILE

# Validate SSH configuration
sudo sshd -t
if [ $? -eq 0 ]; then
    sudo systemctl restart sshd $LOG_FILE
    echo "SSH settings updated and service restarted successfully."
else
    echo "Error: Invalid SSH configuration. Reverting changes."
    exit 1
fi

echo "Script execution completed successfully at $(date)"


# add user 
sudo adduser ec2-user

sudo usermod -aG sudo <username>
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
#######################################
echo "ec2-user:pawws" | sudo chpasswd
# Enable password authentication in SSH
sudo sed -i 's/^#PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config 
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config 
sudo sed -i 's/^#ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config 
sudo sed -i 's/^ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^PermitEmptyPasswords yes/PermitEmptyPasswords no/' /etc/ssh/sshd_config 
sudo sed -i 's/^#UsePAM yes/UsePAM yes/' /etc/ssh/sshd_config 

# Ensure UsePAM is explicitly enabled
echo "UsePAM yes" | sudo tee -a /etc/ssh/sshd_config 
sudo sed -i 's/^#\?\(UsePAM\) no/\1 yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd



# manual 
sudo passwd ec2-user  
then enter password


########################rhel  new config###########
#!/bin/bash

# Define log file
LOG_FILE="/var/log/startup_script.log"
sudo touch $LOG_FILE
# Redirect stdout and stderr to log file


echo "Starting script execution at $(date)"
sudo dnf install -y rsyslog &>>$LOG_FILE

sudo systemctl enable rsyslog
sudo systemctl start rsyslog 

sudo sed -i 's/^#PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config &>>$LOG_FILE
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config &>>$LOG_FILE
sudo sed -i 's/^#ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config &>>$LOG_FILE
sudo sed -i 's/^ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config &>>$LOG_FILE
sudo sed -i 's/^#ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config &>>$LOG_FILE
sudo sed -i 's/^#UsePAM no/UsePAM yes/' /etc/ssh/sshd_config &>>$LOG_FILE
sudo sed -i 's/^UsePAM no/UsePAM yes/' /etc/ssh/sshd_config &>>$LOG_FILE
sudo sed -i 's/^#PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config.d/50-cloud-init.conf &>>$LOG_FILE
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config.d/50-cloud-init.conf &>>$LOG_FILE
sudo sed -i 's/^ssh_pwauth: false/ssh_pwauth: true/' /etc/cloud/cloud.cfg &>>$LOG_FILE

sudo cloud-init clean
sudo cloud-init init 
sudo systemctl restart sshd

# Set the password for "ec2-user" (USE WITH CAUTION)
echo "ec2-user:test@AWS123" | sudo chpasswd
