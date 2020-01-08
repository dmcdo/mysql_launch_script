# mysql_launch_script

The purpose of this is script to easily start and stop the MySQL service when and when you are not using it so that you don't always have to have it running in the background, or so that you don't have to manually start and stop the service from a terminal. When launched, it will start the service via `systemctl` and show a tray icon using `yad` to indicate that the MySQL service is running. When this tray icon is toggled, it will attempt stop the service. Assuming you set up a .desktop file or something similar to run the script, this is all done graphically.

It uses an icon placed in the same directory as the scripts location. This icon comes from the [Papirus icon theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme). You can change this by modifying the $ICONPATH variable if you wish.

## Requirements

- yad
- zenity
- systemd
- MySQL
