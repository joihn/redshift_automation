#!/bin/bash
#Decrease temperature
maxNum=2700
decNum=135;
FILE="redshift_settings_temp"
FILELOCATION="$(dirname "$(realpath "$0")")/$FILE"
if [ ! -f "$FILELOCATION" ]; then
    echo "File does not exist, creating"
    touch "$FILELOCATION"
    echo "$maxNum" > "$FILELOCATION"
fi
rsTemp=$(head -n 1 $FILELOCATION)
if [[ $rsTemp -gt 1000 ]]; then
    let "rsTemp -= decNum";
    redshift -P -O $rsTemp
    echo "$rsTemp" > "$FILELOCATION"
fi
exit 0
