sudo dnf update -y
sudo dnf install dnf-utils -y
#copy repo file
cp nginx.repo /etc/yum.repos.d/nginx.repo
#install nginx
sudo dnf config-manager --set-enabled nginx-mainline

sudo dnf install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl status nginx
