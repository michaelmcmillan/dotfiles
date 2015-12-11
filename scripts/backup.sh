#!/bin/sh
# Put the following line in cron.
# 0 20 * * * bash /Users/michaelmcmillan/scripts/backup.sh >> /Users/michaelmcmillan/scripts/backup.log 2>&1

# Google Drive client
DRIVE=/usr/local/bin/drive

# What to backup on local disk. 
backup_files="/Users/michaelmcmillan/Prosjekter"

# Where to backup to in Google Drive.
dest="0B8cFoexRLCHJS3RRM1MtaDRmeDQ"

function confirm_dialog() {
    local response=$(osascript << EOT
    tell application "Finder"
        activate
        try
            set response to button returned of (display dialog "$1")
            if (response is equal to "OK") then
                set response to 1
            end if
        on error errTet number errNum
            if (errNum is equal to -128) then
                -- user cancelled - not an error
                set response to 0
            end if
        end try
        return response
    end tell
    EOT)
    echo $response
}

# Create archive filename.
day=$(date +%Y-%m-%d:%H:%M)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

# Print the date
date

# Popup-notifier
should_backup=$(confirm_dialog "Backup is due. Kick it off?")

if [ $should_backup = 1 ]; then
    
    # Backup the files using tar and piping it to Google Drive.
    echo "Starting backup!"
    tar czfP - $backup_files | $DRIVE upload --stdin --title $archive_file --parent $dest 

    # Print success
    echo "Backup complete!"
    echo
fi
