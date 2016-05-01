#!/bin/bash

filename="$1"
singleFileName=$(basename $filename)
if [ ! -e "$filename" ]; then
    exit 1
fi
shift

dir=$(dirname $filename)
if [ ! -d "$dir" ]; then
    exit 1
fi

transformDir="$1/$dir"
if [ ! -d "$transformDir" ]; then
    mkdir -p "$transformDir"
    if [ $? -ne 0 ]; then
        exit 1
    fi
fi

withinComment=0

cat $filename | sed -e 's/\/\*[^(\/\*)]*\*\//XYZWL_WL4756362WL_LWZYX/g' -e 's/\/\/.*$/\/\/ ##/' | tr ' ' '\a' | tr '   ' '\b' | while read line;
do
    comStart=$(echo $line | grep -c '/\*')
    comEnd=$(echo $line | grep -c '\*/')

    if [ "$comStart" = "1" ]; then
        if [ "$comEnd" = "0" ]; then
            #replace from comStart
            echo $line | sed -e 's/\/\*.*$/\/* #/'
            withinComment=1
        fi
        continue
    fi

    if [ $withinComment -eq 1 ]; then
        if [ "$comEnd" = "1" ]; then
            #replace until comEnd
            echo $line | sed -e 's/^.*\*\//   # *\//'
            withinComment=0
            continue
        fi
        #replace whole line
        echo "   #"
        continue
    fi
    #none of the above, just print the input
    echo "$line"
done | tr '\a' ' ' | tr '\b' '  ' | sed -e 's/XYZWL_WL4756362WL_LWZYX/\/* ### *\//g' > $transformDir/$singleFileName
exit 0
