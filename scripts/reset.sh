#!/bin/sh

DIR=$( cd $( dirname ${0} ) > /dev/null 2>&1 && pwd )
cd $DIR/../.docker/nginx/files
ls | grep -v default.conf | xargs rm
