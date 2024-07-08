#this is  for configuring mongodb on server
#
# create a mongo repo file
sudo cp mongodb-org.repo /etc/yum.repos.d/mongodb-org.repo
sudo dnf install mongodb-org -y
sudo systemctl enable mongod
sudo systemctl daemon-reload
sudo systemctl start mongod 

# change mongo congfiguration file-mongo listen to default 127.0.0.1-->0.0.0.0 :/etc/mongo.conf

#systemctl resart mongod
