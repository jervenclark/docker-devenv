#!/bin/bash

while read LINE;
do
    PROJECT=$(echo $LINE | cut -d, -f1);
    ROOT=$(echo $LINE | cut -d, -f2);
    cp /root/conf /root/$PROJECT
    sed -i -e "s/server_name _/server_name ${PROJECT}/g" /root/$PROJECT
    sed -i -e "s/status/${PROJECT}/g" /root/$ROOT
done < /root/map
