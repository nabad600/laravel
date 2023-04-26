#!/bin/sh
word=$(echo -n "$INSTALL_ADDITIONAL_EXTENSIONS" | wc -w)

if [[ {OS_TYPE} == alpine ]] ;
then 
    for n in $word
    do
    SERVER_ARRAY=`echo ${INSTALL_ADDITIONAL_EXTENSIONS} | awk '{print $'$n'}' | sed 's/.*-//'`
    sudo apk add --no-cache php${PHP_VERSION}-`echo ${SERVER_ARRAY}`
    done
else 
    for n in $word
    do
    SERVER_ARRAY=`echo ${INSTALL_ADDITIONAL_EXTENSIONS} | awk '{print $'$n'}' | sed 's/.*-//' | sed 's/.*_//'`
    sudo apt install -y php${PHP_VERSION}-`echo ${SERVER_ARRAY}`
    done
fi