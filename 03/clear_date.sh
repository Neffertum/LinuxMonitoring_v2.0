#! /bin/bash

read -p "Print start time in format: \"YYYY-MM-DD HH-MM\":" START_TIME
read -p "Print end time in format: \"YYYY-MM-DD HH-MM\":" END_TIME
check_date="^([0-9]{4})-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$"
check_time="^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$"
start_check_date="$(echo $START_TIME | awk '{print $1}')"
start_check_time="$(echo $START_TIME | awk '{print $2}')"
end_check_date="$(echo $END_TIME | awk '{print $1}')"
end_check_time="$(echo $END_TIME | awk '{print $2}')"

if ! [[ $start_check_date =~ $check_date && $start_check_time =~ $check_time &&\
  $end_check_date =~ $check_date && $end_check_time =~ $check_time ]]; then
  echo "Incorrect date"
  exit
fi

log_directories="$(grep "Directory:" ../02/log.txt | awk '{print $2}' | sort)"
user_files="$(sudo find /home/$(whoami)/ -type f -newerct "$START_TIME" ! -newerct "$END_TIME")"
user_directories="$(dirname $user_files | sort | uniq -d)"
delete_count=0

for i in $user_directories; do
  for j in $log_directories; do
    if [[ $i == $j ]]; then
      sudo rm -rf $i 2>/dev/null
      ((delete_count++))
    fi
  done
done

echo "Deleted $delete_count directories"