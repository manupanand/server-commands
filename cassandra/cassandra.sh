#copy file cassandra repo
cp cassandra /etc/yum.repos.d/cassandra.repo
dnf install cassandra -y
systemctl enable cassandra
systemctl daemon-reload
systemctl start cassandra