#!/bin/bash
#Increase temperature
# set -x
minNum=0.4
incNum=0.1
FILE="redshift_settings_bright"
FILELOCATION="$(dirname "$(realpath "$0")")/$FILE"
APPLYLOCATION="$(dirname "$(realpath "$0")")/apply.sh"

rsBright=$(head -n 1 $FILELOCATION)
if (( $(echo "$minNum < $rsBright" |bc -l) )); then
    rsBright=`echo $rsBright - $incNum | bc`
    echo "$rsBright" > "$FILELOCATION"
    . $APPLYLOCATION 
fi
exit 0
