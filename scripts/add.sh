#!/bin/sh

display_help() {
    echo "\"add.sh\" requires at least 3 argument."
    echo -e "See 'add.sh --help'.\n"
    echo -e "Usage:  add.sh [PROJECT_NAME] [PROJECT_ROOT_DIR] [PROJECT_DIST_DIR]\n"
    echo "Add new nginx configuration"
}

generate_config() {
    cd $( cd $( dirname ${0} ) > /dev/null 2>&1 && pwd )/../.docker/nginx/files
    cp default.conf "${1}.conf"
    sed -i '' "s/server_name _/server_name ${PROJECT}/g" "${1}.conf"
    sed -i '' "s/status/${3}/g" "${1}.conf"
}

if [[  -z $1 || -z $2 || -z $3 || $1 == "--help" ]];
then
    display_help;
else
    generate_config $1 $2 $3;
fi
