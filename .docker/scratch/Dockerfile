FROM ubuntu:bionic

COPY ./conf /root/conf
COPY ./process-map.sh /root/process-map.sh
COPY ./map /root/map

RUN sh /root/process-map.sh
