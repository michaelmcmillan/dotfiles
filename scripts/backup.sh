#!/bin/sh
DRIVE=/usr/local/bin/drive

# What to backup on local disk. 
backup_files="/Users/michaelmcmillan/Prosjekter"

# Where to backup to in Google Drive.
dest="0B8cFoexRLCHJS3RRM1MtaDRmeDQ"

# Create archive filename.
day=$(date +%Y-%m-%d:%H:%M)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

# Backup the files using tar and piping it to Google Drive.
tar czfP - $backup_files | $DRIVE upload --stdin --title $archive_file --parent $dest 
