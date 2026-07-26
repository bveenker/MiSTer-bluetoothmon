# MiSTer-bluetoothmon

A script that resets bluetooth when the last device disconnects

Addresses an issue between MiSTer and 8BitDo's SN30 Pro controller. That controller will not re-connect to the MiSTer if it goes to sleep and is woken up again by the user.

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
