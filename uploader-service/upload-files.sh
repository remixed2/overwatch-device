#!/bin/bash
shopt -s nullglob

#export sleep_time=10
#export monitor_folder="/.../..."
#export b2_bucket="bucket"
#export b2_application_key="appkey"
#export b2_account_id="appkeyid"

b2 authorize-account $b2_account_id $b2_application_key 

cd $monitor_folder
while true
do
    if [ -z "$(ls -A $monitor_folder)" ]; then
        echo "No new files"
    else
        for file in $monitor_folder/*.*; do
            filename=${file##*/}
            echo "Processing file '$filename'"
            sha1=($(sha1sum $file))
            echo "SHA1 checksum '$sha1'"
            b2 upload-file --sha1 $sha1 $b2_bucket $filename raw/$filename
            if [ $? -eq 0 ]
            then 
                echo "Success! Removing file '$filename'"
                rm $filename
            else
                echo "Failed uploading '$filename'"
            fi
        done
    fi
    sleep $sleep_time
done
#b2 list-file-names $b2_bucket