#!/bin/bash
set -ev
until wget http://front.localhost/
do
  sleep 5
  echo "Trying again..."
done
