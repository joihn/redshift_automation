#!/bin/bash
#Increase temperature
# set -x
maxNum=5000
incNum=300
FILE="redshift_settings_temp"
FILELOCATION="$(dirname "$(realpath "$0")")/$FILE"
APPLYLOCATION="$(dirname "$(realpath "$0")")/apply.sh"

rsTemp=$(head -n 1 $FILELOCATION)
if [[ $rsTemp -lt $maxNum ]]; then
    let "rsTemp += incNum";
    echo "$rsTemp" > "$FILELOCATION"
    . $APPLYLOCATION 
fi
exit 0
