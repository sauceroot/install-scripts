
# 2020-03-21
# INSTALL SCRIPT FOR KALI - TESTED ON KALI 2020-1b
# REMEMBER TO RUN AS ROOT

apt update && upgrade -y
apt install -y \
	kali-linux-default \
	terminator \
	curl \
	wget \
	git \
	vim \
	nano \
	ipcalc \
	sipcalc \
	wireshark \
	tcpdump \
	nbtscan \
	enum4linux \
	smbmap \
	p7zip \
	openvpn \
	dsniff \
	nmap \
	metasploit-framework \
	tshark \
	ettercap-text-only \
	traceroute \
	mtr \
	gparted \
	htop \
	ssh \
	ftp \
	tftp \
	snmpcheck \
	onesixtyone \
	snmp-mibs-downloader \
	responder \
	rdesktop \
	bzip2 \
	bind9utils \
	net-tools \
	ldap-utils \
	rpcbind \
	nfs-common \
	whois \
	aircrack-ng \
	socat \
	hping3 \
	rar \
	unrar \
	yersinia \
	screen \
	tmux \
	seclists \
	python3-pip \
	python-pip \
	macchanger \
	masscan \
	bettercap \
	gobuster \
	crackmapexec \
	mlocate \
	powershell-empire \
	golang \
	neo4j \
	bloodhound \
	reaver \
	testssl.sh \
	sslscan \
	sslyze \
	gedit \
	awscli \
	ssh-audit \
	bc \
	windows-binaries

# EXPORT GO PATH
export PATH=$PATH:/usr/local/go/bin

# IMPACKET
cd /opt
git clone https://github.com/SecureAuthCorp/impacket.git impacket
cd /opt/impacket
pip install .

# POSHC2
curl -sSL https://raw.githubusercontent.com/nettitude/PoshC2/master/Install.sh | bash

# RULER
go get github.com/sensepost/ruler

# BLOODHOUND
mkdir -p /opt/bloodhound3
cd /opt/bloodhound3
wget https://github.com/BloodHoundAD/BloodHound/releases/download/3.0.3/BloodHound-linux-x64.zip
unzip BloodHound-linux-x64.zip

mkdir -p /opt/bloodhound2
cd /opt/bloodhound2
wget https://github.com/BloodHoundAD/BloodHound/releases/download/2.2.1/BloodHound-linux-x64.zip
unzip BloodHound-linux-x64.zip

# MITM6
pip install mitm6

# ADIDNSDUMP
cd /opt
git clone https://github.com/dirkjanm/adidnsdump adidnsdump
cd adidnsdump
pip install .

systemctl enable ssh.service
systemctl start ssh.service
