#this is  for configuring mongodb on server
#
# create a mongo repo file
cp mongo.repo /etc/yum.repos.d/mongodb-org.repo
dnf install mongodb-org -y
systemctl enable mongod
systemctl daemon-reload
systemctl start mongod 

# change mongo congfiguration file-mongo listen to default 127.0.0.1-->0.0.0.0 :/etc/mongo.conf

#systemctl resart mongod
