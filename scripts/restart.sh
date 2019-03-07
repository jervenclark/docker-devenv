#!/bin/sh

restart_nginx() {
    docker exec env-stack-nginx nginx -s reload
}

[[ -z $(docker ps | grep env-stack-nginx) ]] || restart_nginx
