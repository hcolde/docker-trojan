#!/bin/bash

tar zxf /work/trojan.tar.gz -C /work

openssl rand -writerand .rnd

openssl genrsa -out server.key 2048

openssl req -new -key server.key -out server.csr -subj /C=CN/ST=Guangdong/L=Shenzhen/O=Personal/OU=Personal/CN=${DOMAIN}

openssl x509 -req -days 3650 -in server.csr -signkey server.key -out server.crt

sed -i "s/mypassword/${PASSWORD}/g" /work/config.json

sed -i "s/mypassword/${PASSWORD}/g" /work/client.json

sed -i "s/example.com/${DOMAIN}/g" /work/client.json

sed -i "s/DOMAIN/${DOMAIN}/g" /work/nginx.conf

mv /work/nginx.conf /etc/nginx/nginx.conf

cp /work/server.crt /work/everythingisconnected

nginx

/work/trojan -c /work/config.json
