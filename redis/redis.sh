sudo dnf module disable redis -y
sudo dnf module enable redis:7 -y
sudo dnf install redis -y 

#edit /etc/redis/redis.conf

sudo systemctl enable redis 
sudo systemctl start redis 