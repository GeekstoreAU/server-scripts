#!/bin/bash

################################################################################
#####
#
# GET ALL REQUIRED INFORMATION FROM THE SYSTEM / USER...
#
#####
################################################################################
echo "What is the new hostname for this system?"
read inputline
newname="$inputline"
oldname=$(cat /etc/hostname)

if [ "$newname" = "" ]; then
    exit 1
fi


hostname "$newname"
echo "Hostname changed from $oldname to $newname"

cat /etc/hosts | sed s/"$oldname"/"$newname"/ > /tmp/newhosts
mv /tmp/newhosts /etc/hosts
echo "The /etc/hosts file has been changed"

echo "Please reboot the system for the changes ot take effect!"
