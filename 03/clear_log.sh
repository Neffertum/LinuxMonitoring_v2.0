#! /bin/bash

MY_LOG="$(grep "Directory:" ../02/log.txt | awk '{print $2}')"
delete_count=0

for i in $MY_LOG; do
  sudo rm -rf $i 2>/dev/null
  ((delete_count++))
done

echo "Deleted $delete_count directories"