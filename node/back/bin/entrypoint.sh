#!/bin/bash

cd /srv/app

until nc -z -v -w30 db 3306
do
  echo "Waiting for database connection..."
  # wait for 2 seconds before check again
  sleep 2
done

./bin/opla migrations up --non-interactive

exec node --inspect dist/
