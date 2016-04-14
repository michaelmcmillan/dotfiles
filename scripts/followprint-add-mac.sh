#! /bin/bash

# README
# Adds a NTNU printer on Mac OS X (tested on Yosemite, may work on liux as well since it also uses CUPS)
# Default settings is used (as explained on innsida, duplex, A4, etc.)

# USAGE
# ./followprint-add-mac.sh <queuename>

# Ex.
# ./followprint-add-mac.sh dmf-datasal

# For easy download and use, open a terminal and do

# curl -O https://raw.githubusercontent.com/Orakeltjenesten/scripts/master/print/followprint-add-mac.sh
# chmod +x followprint-add-mac.sh

# and then, f. ex.

# ./followprint-add-mac.sh dmf-datasal
# ./followprint-add-mac.sh bmh-ntnu-2etg

curl -sO https://raw.githubusercontent.com/Orakeltjenesten/scripts/master/print/GenericPostScript.ppd
sudo lpadmin -E -p "$1" -v "smb://followprint.win.ntnu.no/$1" -P "GenericPostScript.ppd" -o printer-is-shared=false -o printer-op-policy=authenticated
cupsenable "$1"
cupsaccept "$1"
rm GenericPostScript.ppd

