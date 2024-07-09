

# install golang

goLang(){
  sudo dnf install ${library} -y
  go version

}
installNginx(){
  sudo dnf update -y
  sudo dnf install dnf-utils -y
#copy repo file
  cp ${library}.repo /etc/yum.repos.d/${library}.repo
#install nginx
sudo dnf config-manager --set-enabled ${library}-mainline

sudo dnf install ${library} -y
sudo systemctl enable ${library}
sudo systemctl start ${library}
sudo systemctl status ${library}
}