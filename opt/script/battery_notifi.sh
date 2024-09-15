#!/bin/bash
while true
do
  battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
   if [ $battery_level -ge 95 ]; then
      notify-send "Battery Full" "Level: ${battery_level}%" --icon=battery-caution
    elif [ $battery_level -le 20 ]; then
      notify-send --urgency=CRITICAL "Battery Low" "Level: ${battery_level}%" --icon=battery-low
    elif [ $battery_level -le 10 ]; then
      notify-send --urgency=CRITICAL "Battery Low" "Level: ${battery_level}%" --icon=battery-low
      paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
  fi
 sleep 600
done
