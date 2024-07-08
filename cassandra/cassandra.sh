#copy file cassandra repo
sudo cp cassandra.repo /etc/yum.repos.d/cassandra.repo
sudo dnf install cassandra -y
sudo systemctl enable cassandra
sudo systemctl daemon-reload
sudo systemctl start cassandra

#errror


#  Control process exited, code=exited, status=1/FAILURE
# Jul  8 14:15:33 ip-172-31-43-156 systemd[1]: cassandra.service: Failed with result 'oom-kill'.
# Jul  8 14:15:33 ip-172-31-43-156 systemd[1]: cassandra.service: Consumed 6.617s CPU time.
# Jul  8 14:17:28 ip-172-31-43-156 systemd[1]: Reloading.
# Jul  8 14:17:28 ip-172-31-43-156 systemd-rc-local-generator: /etc/rc.d/rc.local is not marked executable, skipping.
# Jul  8 14:17:28 ip-172-31-43-156 systemd-sysv-generator: SysV service '/etc/rc.d/init.d/choose_repo' lacks a native systemd unit file. Automatically generating a unit file for compatibility. Please update package to include a native systemd unit file, in order to make it more safe and robust.
# Jul  8 14:17:28 ip-172-31-43-156 systemd-sysv-generator: SysV service '/etc/rc.d/init.d/rh-cloud-firstboot' lacks a native systemd unit file. Automatically generating a unit file for compatibility. Please update package to include a native systemd unit file, in order to make it more safe and robust.
# Jul  8 14:17:28 ip-172-31-43-156 systemd-sysv-generator: SysV service '/etc/rc.d/init.d/cassandra' lacks a native systemd unit file. Automatically generating a unit file for compatibility. Please update package to include a native systemd unit file, in order to make it more safe and robust.
# Jul  8 14:17:28 ip-172-31-43-156 systemd[1]: /run/systemd/generator.late/cassandra.service:27: PIDFile= references a path below legacy directory /var/run/, updating /var/run/cassandra/cassandra.pid → /run/cassandra/cassandra.pid; please update the unit file accordingly.
# Jul  8 14:17:28 ip-172-31-43-156 systemd[1]: system.slice: A process of this unit has been killed by the OOM killer.

