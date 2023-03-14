#!/bin/bash
#Decrease temperature
# set -./x
maxNum=2400
decNum=250;
FILE="redshift_settings_temp"
FILELOCATION="$(dirname "$(realpath "$0")")/$FILE"
APPLYLOCATION="$(dirname "$(realpath "$0")")/apply.sh"
rsTemp=$(head -n 1 $FILELOCATION)
if [[ $rsTemp -gt maxNum ]]; then
    let "rsTemp -= decNum";
    echo "$rsTemp" > "$FILELOCATION"
    . $APPLYLOCATION 
fi
exit 0
