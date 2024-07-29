#!/bin/sh

# Replace environment variables for all languages
# for dir in /etc/nginx/html/*/

dir="/etc/nginx/html/"
mainFileName="$(ls ${dir}main*.js)"
envsubst '$API_GATEWAY_URL $BACKEND_URL $APPINSIGHTS_INSTRUMENTATIONKEY' < ${mainFileName} > main.tmp
echo "Replacing env variables in file $mainFileName"
mv main.tmp ${mainFileName}

nginx -g "daemon off;"
