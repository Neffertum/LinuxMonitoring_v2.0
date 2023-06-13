#! /bin/bash

chmod +x print.sh

if [[ $# -ne 1 ]]; then
  echo "Need only one argument"
else
  ./print.sh $1
fi