#! /bin/bash

chmod +x my_check.sh

if [[ $# -ne 0 ]]; then
  echo "Please, NO argument"
else
  while sleep 5; do
    ./my_check.sh > my_metrics.html
  done
fi