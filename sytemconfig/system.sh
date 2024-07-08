#install firewall
sudo dnf update -y
sudo dnf install dnf-utils -y
sudo dnf install firewalld -y
sudo systemctl enable firewalld
sudo systemctl start firewalld