
LOG_FILE=/var/tmp/install.log

PRINT(){
  echo  &>> $LOG_FILE
  echo  &>> $LOG_FILE
  echo "####################### $* ##########################" &>> $LOG_FILE
  echo $*
}
# install golang
PRINT Installing golang
goLang(){
  sudo dnf install ${library} -y &>> $LOG_FILE
  go version

}
# install nginx

installNginx(){
  PRINT updating dnf-utils
  sudo dnf update -y &>>$LOG_FILE
  sudo dnf install dnf-utils -y &>> $LOG_FILE
#copy repo file
PRINT copying nginx-repo
  cp ${library}.repo /etc/yum.repos.d/${library}.repo &>> $LOG_FILE
#install nginx
PRINT Installing nginx
sudo dnf config-manager --set-enabled ${library}-mainline &>> $LOG_FILE

sudo dnf install ${library} -y &>> $LOG_FILE
sudo systemctl enable ${library} &>> $LOG_FILE
sudo systemctl start ${library} &>> $LOG_FILE
sudo systemctl status ${library} &>> $LOG_FILE
}