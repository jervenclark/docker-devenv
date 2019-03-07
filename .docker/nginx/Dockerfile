FROM nginx:alpine

COPY ./files/* /etc/nginx/conf.d/*

COPY ./process-map.sh /root/process-map.sh
COPY ./map /root/map

RUN sh /root/process-map.sh

EXPOSE 80
