#!/bin/sh

cd $( cd $( dirname ${0} ) > /dev/null 2>&1 && pwd )
ls ../.docker/nginx/conf.d | grep -v default.conf | xargs rm
