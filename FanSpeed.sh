#!/bin/bash

if [ $# -ne 1 ] ; then
	echo -e "\n\n\n    COMMAND:   FanSpeed <level>\n"
	echo "    - Level can be between '0' (disabled) and '7', 'full-speed', or 'auto'."
	echo -e "\n\n        You can also use 'FanSpeed show' to print the current level\n\n\n"
	exit 1
fi

echo -e "\n\n"

case $1 in
	0|1|2|3|4|5|6|7|auto|full-speed)
		echo level $1 | sudo tee /proc/acpi/ibm/fan
		;;
	show)
		grep "level:" /proc/acpi/ibm/fan
		;;
	*)
		echo -e "    UNSUPORTED ARGUMENT\n\n\n"
		exit 2
		;;
esac

echo -e "\n\n"
exit 0
