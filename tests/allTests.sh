#!/bin/bash
dir="`dirname "$0"`"
cd "`readlink -f "$dir"`"

HAS_ERROR=0
for i in */*Test.sh; do
    echo "Execute \`${i}\`:"
    "./$i"
    if [ $? -ne 0 ]; then
        HAS_ERROR=1
    fi
    echo
done

if [ $HAS_ERROR -eq 0 ]; then
    echo "all OK"
else
    echo "some ERRORs"
fi

exit $HAS_ERROR
