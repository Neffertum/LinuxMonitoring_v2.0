#! /bin/bash

chmod +x clear_log.sh
chmod +x clear_date.sh
chmod +x clear_mask.sh

if [[ $# -ne 1 ]]; then
  echo "Need only one argument"
elif [[ $1 -eq 1 ]]; then
  echo "Cleaning by log file"
  ./clear_log.sh
elif [[ $1 -eq 2 ]]; then
  echo "Cleaning by date"
  ./clear_date.sh
elif [[ $1 -eq 3 ]]; then
  echo "Cleaning by mask"
  ./clear_mask.sh
else
  echo "Agrument must be 1, 2 or 3"
fi