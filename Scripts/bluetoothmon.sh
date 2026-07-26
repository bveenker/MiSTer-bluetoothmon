#!/usr/bin/env bash

LOGFILE=/tmp/${0##*/}.log
PIDFILE=/tmp/${0##*/}.pid

get_connected_bt_devices() {
    local count=0

    while read -r _ mac _; do
        if bluetoothctl info "$mac" | grep -q "Connected: yes"; then
            ((count++))
        fi
    done < <(bluetoothctl devices)

    echo "$count"
}

install() {
  if ! grep -q "# bveenker/bluetoothmon" /media/fat/linux/user-startup.sh ; then
    echo Installing ${0##*/}... >> $LOGFILE
    echo '
# bveenker/bluetoothmon
[[ -e /media/fat/Scripts/bluetoothmon.sh ]] && /media/fat/Scripts/bluetoothmon.sh $1 &' >> /media/fat/linux/user-startup.sh
  fi

}

start() {
  echo Starting ${0##*/}... >> $LOGFILE

  echo "$$" > $PIDFILE
  
  total_connected=0
  while true; do
	
	echo there are no bluetooth devices >> $LOGFILE
    while [ $total_connected -eq "0" ]; do
	  echo reset bluetooth >> $LOGFILE
	  bluetoothctl power off >> $LOGFILE
	  sleep 1
	  bluetoothctl power on >> $LOGFILE
	  
      sleep 10
	  total_connected=$(get_connected_bt_devices)
    done
	
	echo there is at least one connected. wait until there are none  >> $LOGFILE
    while [ $total_connected -ne "0" ]; do
      sleep 10
	  total_connected=$(get_connected_bt_devices)
    done
	
  done
  
}

stop() {
  echo Stopping ${0##*/}... >> $LOGFILE
  
  if [[ -f $PIDFILE ]]; then
    kill "$(cat $PIDFILE)"
    rm -f $PIDFILE
  fi
}

restart() {
  echo Restarting ${0##*/}... >> $LOGFILE
  stop
  ${0} start &
}

main() {
  install
  if [ -z "$1" ]; then
    ${0} start &
  else
    "${1}"
  fi
}

main "${@}"

