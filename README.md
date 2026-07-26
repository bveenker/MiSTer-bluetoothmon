MiSTer-bluetoothmon
A script for resetting bluetooth after the last device disconnects

This addresses a bug seen when using the 8BitDo SN30 Pro controller or similar device

Prerequisites
An Internet connected MiSTer
Setup
Add the following to /media/fat/downloader.ini.
[bveenker/bluetoothmon]
db_url = https://raw.githubusercontent.com/bveenker/MiSTer-bluetoothmon/db/db.json.zip
Run update or update_all from the Scripts menu.
From the Scripts menu run syncthing.
Open http://mister.local:8384
