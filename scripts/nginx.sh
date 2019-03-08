#!/bin/sh

cd $( cd $( dirname ${0} ) > /dev/null 2>&1 && pwd )

display_help() {
    echo "See 'nginx.sh help'.\n";
    echo "Usage: nginx.sh [COMMAND]\n"
    echo "COMMANDS:"
    echo "\thelp\tDisplay this help message."
    echo "\trestart\tRestart nginx process inside the container."
    echo "\treset\tRemove all server configurations inside conf.d."
    echo "\tadd\tAdd new nginx conf"
    echo "\n"
}

restart_nginx() {
    cont=env-stack-nginx
    [[ -n $(docker ps | grep $cont) ]] && docker exec $cont nginx -s reload
}

reset_nginx() {
    cd ../.docker/nginx/conf.d
    ls | grep -vE "default|template" | xargs rm
}

add_nginx() {
    cd ../.docker/nginx/conf.d
    cp template.conf.example "${1}.conf"
    sed -i '' "s/wpfrp/${1}/g" "${1}.conf"
}

case $1 in
    'help')
        display_help
        ;;
    'restart')
        restart_nginx
        ;;
    'reset')
        reset_nginx
        restart_nginx
        ;;
    'add')
        if [[ -n $2 ]]
        then
            add_nginx $2
            restart_nginx
        else
            display_help
        fi
        ;;
    *)
        display_help
        ;;
esac
