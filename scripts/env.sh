#!/bin/sh

cd $( cd $( dirname ${0} ) > /dev/null 2>&1 && pwd )/..

display_help() {
    echo "See 'env.sh help'.\n";
    echo "Usage: env.sh [COMMAND]\n"
    echo "COMMANDS:"
    echo "\thelp\tDisplay this help message."
    echo "\tbuild\tBuild and run containers"
    echo "\tdestroy\tStop and remove containers"
    echo "\trun\tRun containers without rebuilding them"
    echo "\thalt\tStop the running containers"
    echo "\n"
}

case $1 in
    'help')
        display_help
        ;;
    'build')
        docker-compose up --build -d "${@:2}"
        ;;
    'destroy')
        docker-compose down "${@:2}"
        ;;
    'run')
        docker-compose up -d "${@:2}"
        ;;
    'halt')
        docker-compose stop "${@:2}"
        ;;
    *)
        display_help
        ;;
esac
