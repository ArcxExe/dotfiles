#!/bin/bash
battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')
#temp_level=$(acpi -t | grep -o '[0-9][0-9]\.[0-9]*')
notify-send "Заряд батареи: ${battery_level}%" --icon=battery 
