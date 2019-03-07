#!/bin/sh

cd $( cd $( dirname ${0} ) > /dev/null 2>&1 && pwd )

display_help() {
    echo "\"add.sh\" requires at least 1 argument."
    echo -e "See 'add.sh --help'.\n"
    echo -e "Usage:  add.sh [PROJECT_NAME]\n"
    echo "Add new nginx configuration"
}

generate_config() {
    cd ../.docker/nginx/conf.d
    cp wpfrp.conf "${1}.conf"
    sed -i '' "s/wpfrp/${1}/g" "${1}.conf"
}

restart_nginx() {
    docker exec env-stack-nginx nginx -s reload
}

if [[  -z $1 || $1 == "--help" ]];
then
    display_help;
else
    generate_config $1 $2 $3;
    [[ -z $(docker ps | grep env-stack-nginx) ]] || restart_nginx
fi
