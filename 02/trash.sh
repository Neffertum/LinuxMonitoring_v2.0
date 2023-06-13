#! /bin/bash

function free_mem {
size_mem=$(df -h /root | tail -n1 | awk '{print substr($4, 1, length($4)-1)}')
if [[ ${size_mem#*.} -eq 1 ]]; then
  echo "Free space less than one gigabyte"
  exit
fi
}

random_count_fol="$(shuf -i 35-100 -n 1)"

for (( i = 0; i < $random_count_fol; i++ )); do
  free_mem
  random_path="$(compgen -d /home/$(whoami)/ | shuf -n 1)"
  sudo mkdir ${random_path}/${FOL_NAME}_${NAME_DATE} 2>/dev/null
  echo "Directory: ${random_path}/${FOL_NAME}_${NAME_DATE}">>log.txt
  random_count_fi="$(shuf -i 35-100 -n 1)"
  for (( j = 0; j < $random_count_fi; j++ )); do
    free_mem
    sudo fallocate -l $MY_SIZE"MB" ${random_path}/${FOL_NAME}_${NAME_DATE}/${FI_NAME}_${NAME_DATE}.${FI_EXE} 2>/dev/null
    echo "File: ${random_path}/${FOL_NAME}_${NAME_DATE}/${FI_NAME}_${NAME_DATE}.${FI_EXE} ${LOG_DATE} ${MY_SIZE}Mb">>log.txt
    FI_NAME=$FI_NAME${FI_NAME: -1}
  done
  FI_NAME=$base_fi_name
  FOL_NAME=$FOL_NAME${FOL_NAME: -1}
done