#! /bin/bash

if [[ $1 -eq 1 ]]; then
  cat ../04/log_*.log | sort -k9
  cat ../04/log_*.log | sort -k9 > sort_code.log
elif [[ $1 -eq 2 ]]; then
  cat ../04/log_*.log | awk '{print $1}' | uniq -u
  cat ../04/log_*.log | awk '{print $1}' | uniq -u > uniq_ip.log
elif [[ $1 -eq 3 ]]; then
  cat ../04/log_*.log | grep -e "[ ][45][0-9][0-9][ ][0-9]"
  cat ../04/log_*.log | grep -e "[ ][45][0-9][0-9][ ][0-9]" > error_code.log
elif [[ $1 -eq 4 ]];then
  cat ../04/log_*.log | grep -e "[ ][45][0-9][0-9][ ][0-9]" | awk '{print $1}' | uniq -u
  cat ../04/log_*.log | grep -e "[ ][45][0-9][0-9][ ][0-9]" | awk '{print $1}' | uniq -u > uniq_error_ip.log
else
  echo "Argument must be only 1, 2, 3 or 4"
fi