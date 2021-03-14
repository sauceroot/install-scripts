#!/bin/bash

# This relies on the netselect-apt package installed in the packages-only script.

# Look for fastest mirrors including source and non-free
netselect-apt -s -n

# Backup existing sources.list
cp /etc/apt/sources.list /etc/apt/sources.list.bak

# Copy new sources list to /etc
mv sources.list /etc/apt/sources.list
