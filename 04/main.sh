#! /bin/bash

chmod +x create.sh

if [[ $# == 0 ]]; then
  ./create.sh
else
  echo "Please, NO argument"
fi