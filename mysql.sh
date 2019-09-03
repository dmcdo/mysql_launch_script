#!/usr/bin/env bash

ICONPATH="$( cd "$(dirname "$0")" ; pwd -P )/icon.svg"

loop=true

if [[ $(pgrep mysql) == "" ]]; then
    systemctl start mysql
fi

# If mysql did not start, do not enter loop
# (It's likely that user cancelled the operation)
if [[ $(pgrep mysql) == "" ]]; then
    loop=false
    zenity --notification --text "The MySQL service was not started"
fi

while $loop
do
    # Show tray icon
    yad --notification --command='quit' --image=$ICONPATH
    # Hold until toggled, then close tray icon

    # Once tray icon has been toggled
    systemctl stop mysql

    # If mysql process exited, exit the loop
    if [[ $(pgrep mysql) == "" ]]; then
        loop=false
    else
        # Otherwise, notify the user
        zenity --notification --text "The MySQL service was not ended"
    fi
done
