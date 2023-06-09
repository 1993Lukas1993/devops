#!/bin/bash

# List of variables

BACKUP_SOURCE="$1"
BACKUP_TARGET="$2"
LOGFILE=backup_log.txt

# testing of arguments

        if [ $# != 2 ]; then
                echo "Usage: ./backup.sh <SOURCE> <TARGET>"
                exit 2
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

        read  OVERWRITE

        case $OVERWRITE in

        1) rm -rf $BACKUP_TARGET && mkdir $BACKUP_TARGET && echo "Target directory will be overwritted" ;;
        2) echo "Exiting script" && exit 1 ;;
        *) echo "Please select yes or no" && exit 1 ;;

        esac

        else

        mkdir $BACKUP_TARGET
        return 0

        fi
}

copy () {
        echo "Copying files:"
        cp -Rv $BACKUP_SOURCE/* $BACKUP_TARGET
        echo "===================================================="
        echo "Files copied:"
        echo "$( ls -latrh $BACKUP_TARGET )"
        echo "===================================================="
        echo "This backup was performed at `date`"
}


# testing for backup log

        if [ -f $LOGFILE ]; then
                rm -rf $LOGFILE
        fi


# Checking source directory

check_source

# Checking target directory

check_target

# copying files

copy 2>&1 >> $LOGFILE


clear
cat $LOGFILE
