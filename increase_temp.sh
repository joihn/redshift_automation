#!/bin/bash
#Increase temperature
maxNum=3600
incNum=135
FILE="redshift_settings"
FILELOCATION="$(dirname "$(realpath "$0")")/$FILE"
if [ ! -f "$FILELOCATION" ]; then
    echo "File does not exist, creating"
    touch "$FILELOCATION"
    echo "$maxNum" > "$FILELOCATION"
fi
rsTemp=$(head -n 1 $FILELOCATION)
if [[ $rsTemp -lt $maxNum ]]; then
    let "rsTemp += incNum";
    redshift -P -O $rsTemp
    echo "$rsTemp" > "$FILELOCATION"
fi
exit 0
