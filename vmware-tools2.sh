#!/bin/sh

if [ -f /etc/systemd/system/mnt-hgfs.mount ]
then
echo "/etc/systemd/system/mnt-hgfs.mount exists."
else
echo "/etc/systemd/system/mnt-hgfs.mount does not exist."
cat << EOF > /etc/systemd/system/mnt-hgfs.mount
[Unit]
Description=VMware mount for hgfs
DefaultDependencies=no
Before=umount.target
ConditionVirtualization=vmware
After=sys-fs-fuse-connections.mount

[Mount]
What=vmhgfs-fuse
Where=/mnt/hgfs
Type=fuse
Options=default_permissions,allow_other

[Install]
WantedBy=multi-user.target
EOF
fi
