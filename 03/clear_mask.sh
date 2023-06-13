#! /bin/bash

echo "Print mask of directory's name in format: "SYMBOLS_DATE""
read -p "Maximum of sybmols - 7, date in format\"DDMMYY\":" USER_MASK

if ! [[ $USER_MASK =~ ^([a-zA-Z]{1,7})_((0[1-9]|[12][0-9]|3[01])(0[1-9]|1[0-2])([0-9]{2}))$ ]]
then
  echo "Incorrect input"
  exit
fi

USER_SYMBOLS="${USER_MASK%_*}"
USER_DATE="${USER_MASK#*_}"


log_directories="$(grep "Directory:" ../02/log.txt | awk '{print $2}' | sort)"
user_directories="$(sudo find /home/$(whoami)/ -type d -name "${USER_SYMBOLS}*_${USER_DATE}")"
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