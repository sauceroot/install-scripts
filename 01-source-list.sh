#!/bin/sh

#############################################################
# APT SOURCE LIST
# Run this before running the packages-only script because some of the required repos aren't installed by default.

# Backup sources.list in case of breakage
cp /etc/apt/sources.list /etc/apt/sources.list.bak

# Set up sources list to use main contrib and non-free repos
cat << EOF > /etc/apt/sources.list
deb http://deb.debian.org/debian buster main contrib non-free
deb-src http://deb.debian.org/debian buster main contrib non-free

deb http://deb.debian.org/debian-security/ buster/updates main contrib non-free
deb-src http://deb.debian.org/debian-security/ buster/updates main contrib non-free

deb http://deb.debian.org/debian buster-updates main contrib non-free
deb-src http://deb.debian.org/debian buster-updates main contrib non-free
EOF

