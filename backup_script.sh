#!/bin/bash

# List of variables

BACKUP_SOURCE="$1"
BACKUP_TARGET="$2"

# testing of arguments

	if [ $# != 2 ]; then
		echo "Usage: ./backup.sh <SOURCE> <TARGET>"
		exit 1
	fi

# List of functions

check_source () {

	if [ ! -d $BACKUP_SOURCE ]; then
		echo "Directory which you want to backup does not exist, please choose other directory."
		exit 1
	fi

}


check_target () {


	if [ -d $BACKUP_TARGET ]; then
	echo "Directory $BACKUP_TARGET already exist, Do you want to overwrite it?"
	echo "===================================================="
	echo "1 - yes, overwrite $BACKUP_TARGET"
	echo "2 - no, exit the script"
	echo "===================================================="

	read -s OVERWRITE

	case $OVERWRITE in 
	
	1) rm -rf $BACKUP_TARGET && mkdir $BACKUP_TARGET && echo "Target directory was overwritted" ;;
	2) echo "Exiting script" && exit 1 ;;
	*) echo "Please select yes or no" && exit 1 ;;
		
	esac 
		
	else
		
	mkdir $BACKUP_TARGET
	return 0

	fi
}

# Calling of functions

check_source

check_target

# Testing for backup log

	if [ -f backup_log.txt ]; then
		rm -rf backup_log.txt
	fi

# Copying of files

	echo "Copying files:" >> backup_log.txt
	cp -v $BACKUP_SOURCE/* $BACKUP_TARGET 2>&1 >> backup_log.txt
	echo "===================================================="
	echo "Files copied:" >> backup_log.txt
	echo "$( ls -latrh $BACKUP_TARGET )" >> backup_log.txt
	echo "This backup was performed at `date`" >> backup_log.txt




