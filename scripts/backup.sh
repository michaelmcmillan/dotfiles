#!/bin/sh
# Put the following line in cron.
# 0 20 * * * bash /Users/michaelmcmillan/scripts/backup.sh >> /Users/michaelmcmillan/scripts/backup.log 2>&1

# Google Drive client
DRIVE=/usr/local/bin/drive

# What to backup on local disk. 
backup_files="/Users/michaelmcmillan/Prosjekter"

# Where to backup to in Google Drive.
dest="0B8cFoexRLCHJS3RRM1MtaDRmeDQ"

# Create archive filename.
day=$(date +%Y-%m-%d:%H:%M)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

# Print the date
date

# Popup-notifier
osascript -e 'tell app "System Events" to display dialog "Backup starting. Keep in mind."' 2>&1

# Backup the files using tar and piping it to Google Drive.
tar czfP - $backup_files | $DRIVE upload --stdin --title $archive_file --parent $dest 

# Print success
echo "Backup complete!"
echo 
