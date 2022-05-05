#!/bin/bash


name=$0

printHelp() {
	echo -e "\n\t COMMAND:  $name <level>\n"
	echo -e "\t - Level can be between '0' (disabled) and '7', 'full-speed', or 'auto'."
	echo -e "\n\n\t\t You can also use '$name show' to print the current level\n\n\n"
}

echo -e "\n\n"

if [ $# -ne 1 ]; then
	printHelp
	exit 1
fi

case $1 in
	0|1|2|3|4|5|6|7|auto|full-speed)
		echo level $1 | sudo tee /proc/acpi/ibm/fan
		;;
	show)
		grep "level:" /proc/acpi/ibm/fan
		;;
	-h|-help|--help)
		printHelp
		exit 0
		;;
	*)
		echo -e "\t !! UNSUPORTED ARGUMENT !!"
		printHelp
		exit 2
		;;
esac

echo -e "\n\n"
exit 0
