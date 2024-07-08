sudo dnf install dnf-utils
#copy repo file
cp nginx.repo /etc/yum.repos.d/nginx.repo
#install nginx
sudo dnf config-manager --set-enabled nginx-mainline

sudo dnf install nginx
