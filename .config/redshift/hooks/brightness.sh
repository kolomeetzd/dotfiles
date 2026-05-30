#!/bin/sh

# Set brightness via light when redshift status changes

# Set brightness values for each status.
# Range from 1 to 100 is valid
brightness_day=20
brightness_transition=15
brightness_night=10

if [ "$1" = period-changed ]; then
	case $3 in
		night)
			light -S $brightness_night
			;;
		transition)
			light -S $brightness_transition
			;;
		daytime)
			light -S $brightness_day
			;;
	esac
fi
