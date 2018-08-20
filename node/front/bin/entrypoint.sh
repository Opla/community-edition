#!/bin/bash

cd /srv/app

touch /tmp/foo
while true;
do
  echo "Connecting to the backend at '${OPLA_API_DOMAIN}'..."
  up=`wget -o /tmp/foo ${OPLA_API_DOMAIN}/api/v1/admin/languages | grep '200' /tmp/foo | wc -l`
  echo $up;
  if [ "$up" -eq "1" ]; then
    break
  fi

  echo "wait backend to be up !"
  sleep 2
done


if [ ! -f config/default.json ]; then
  ./bin/opla init --non-interactive \
  --overwrite \
  --client-name ${OPLA_FRONT_CLIENT_NAME} \
  --api-host ${OPLA_API_DOMAIN} \
  --api-port 80 \
  --api-protocol http
fi

yarn build:prod
cd /srv/app/dist
exec node --inspect .

