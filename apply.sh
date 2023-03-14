#!/bin/bash
#Decrease temperature
maxNum=2700
decNum=135;
FILE_TEMP="redshift_settings_temp"
FILELOCATION_TEMP="$(dirname "$(realpath "$0")")/$FILE_TEMP"

FILE_BRIGHT="redshift_settings_bright"
FILELOCATION_BRIGHT="$(dirname "$(realpath "$0")")/$FILE_BRIGHT"

temp=$(head -n 1 $FILELOCATION_TEMP)
bright=$(head -n 1 $FILELOCATION_BRIGHT)

redshift -P -O $temp -b $bright

