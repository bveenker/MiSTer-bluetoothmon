# MiSTer-bluetoothmon

UPDATE: This script works, but there is a better way to deal with troublesome BlueTooth devices on MiSTer. In MiSTer.ini, edit the bt_auto_disconnect value. Use a short value (say, 3 minutes) at first, then gradually increase. You want the MiSTer to disconnect idle devices before they timeout on their own. I like 5 minutes.

A script that resets bluetooth when the last device disconnects

Addresses an issue between MiSTer and 8BitDo's SN30 Pro controller. Since that controller will not re-connect to the MiSTer after going to sleep, this script will reset MiSTer's bluetooth when it sees the last device disconnect.

This script only checks the devices every 60 seconds. That means you may not see it take effect if devices are being connected/disconnected quickly. In addition, your MiSTer will only notice that a device has disconnected after about 60 seconds. Give your MiSTer a few minutes between connections/disconnections.

## Prerequisites

* An Internet connected MiSTer

## Setup

1. Add the following to `/media/fat/downloader.ini`.

```ini
[bveenker/bluetoothmon]
db_url = https://raw.githubusercontent.com/bveenker/MiSTer-bluetoothmon/db/db.json.zip
```

2. Run `update` or `update_all` from the Scripts menu.
3. From the Scripts menu run `bluetoothmon`. Script will start automatically on subsequent reboots
