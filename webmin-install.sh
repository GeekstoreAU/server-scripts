#!/bin/bash
#####################
# Add Repo Line 1
if ! grep -q download.webmin.com /etc/apt/sources.list; then
	echo deb http://download.webmin.com/download/repository sarge contrib | sudo tee -a /etc/apt/sources.list
fi
#####################
#Add Repo Line 2
if ! grep -q webmin.mirror.somersettechsolutions.co.uk /etc/apt/sources.list; then
	echo deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib | sudo tee -a /etc/apt/sources.list
fi
#####################
#Get The GPG Key
wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add -
#####################
sudo apt-get update && sudo apt-get -y install webmin
#####################
clear
echo Webmin Installation is Complete!
#####################
