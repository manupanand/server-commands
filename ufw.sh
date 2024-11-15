sudo vim /etc/default/ufw

#check ipv6==yes
sudo ufw status
sudo ufw enable
sudo ufw  default deny incoming
sudo ufw default allow outging

sudo ufw app list 
sudo ufw allow OpenSSH
sudo ufw allow ssh

# specific port
    sudo ufw allow 6000:6007/tcp
    sudo ufw allow 6000:6007/udp

 # specific ip

 sudo ufw allow from 203.0.113.4

 sudo ufw deny http

 sudo ufw allow 2222/tcp 

sudo ufw allow 'Nginx Full'

#Allow Internal Communication to Backend Servers:
sudo ufw allow 3001/tcp
sudo ufw allow 3002/tcp