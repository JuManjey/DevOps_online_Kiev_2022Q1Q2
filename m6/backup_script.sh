#!/bin/bash

####################################
#
# Backup to NFS mount script.
#
####################################
echo "enter the pwd to backup fiels:"
read -a array
echo "you enter result: " $array;
# What to backup. 
backup_files=$array;

# Where to backup to.
echo "enter the pwd directory for backup fiels:"
read -a array2
echo "you enter result: " $array2;
dest=$array2;

# Create archive filename.
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

# Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"
date
echo

# Backup the files using tar.
tar czf $dest/$archive_file $backup_files

# Print end status message.
echo
echo "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest
