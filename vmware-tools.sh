#!/bin/sh

# This script installs the packages for vmware tools and sets up shares to automount
# Remember to allow the share folder in vm settings on the host system  
# Source: https://kb.vmware.com/s/article/74650

# If the host is running on vmware, install open-vm-tools
if dmesg | grep -qi "Hypervisor detected: VMware"
	then
		echo "System is a vmware vm."
		apt update -y && apt install open-vm-tools open-vm-tools-desktop -y
	else    
		echo "System is not a vmware vm."
fi

# Create systemd unit file
if [ -f /etc/systemd/system/mnt-hgfs.mount ]
	then
		echo "/etc/systemd/system/mnt-hgfs.mount exists."
	else
		echo "/etc/systemd/system/mnt-hgfs.mount does not exist."
		cat << EOF > "/etc/systemd/system/mnt-hgfs.mount"
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


if [ -f /etc/modules-load.d/open-vm-tools.conf ]
	then
		echo "/etc/modules-load.d/open-vm-tools.conf exists."
	else
		echo "/etc/modules-load.d/open-vm-tools.conf does not exist."
		cat << EOF > /etc/modules-load.d/open-vm-tools.conf
		fuse
EOF
fi

# Enable the service to run on startup
systemctl enable mnt-hgfs.mount

# Make sure the modprobe module is loaded
modprobe -v fuse

# Start the service 
systemctl start mnt-hgfs.mount
