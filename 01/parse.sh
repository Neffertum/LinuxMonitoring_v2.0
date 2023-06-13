#! /bin/bash

>logs.txt

export MY_DATE="$(date +%d%m%y)"
export LOG_MY_DATE="$(date +%d.%m.%y)"
fold_count=0
fil_count=0

function free_mem {
size_mem=$(df -k /root | tail -n1 | awk '{print $4}')
if [[ $size_mem -le 1048576 ]]; then
  echo "Free space less than one gigabyte"
  exit
fi
}

while [[ ${#FO_SYMB} -lt 4 ]]; do
  FO_SYMB=$FO_SYMB${FO_SYMB: -1}
done
while [[ ${#FI_NAME} -lt 4 ]]; do
  FI_NAME=$FI_NAME${FI_NAME: -1}
done
base_fi_name=$FI_NAME

for (( i = 0; i < $FOLDERS; i++)); do
  free_mem
  sudo mkdir ${MY_PATH}${FO_SYMB}_${MY_DATE} 2>/dev/null
  echo "Directory: ${MY_PATH}${FO_SYMB}_${MY_DATE}">>logs.txt
  for (( j = 0; j < $FILES; j++)); do
    free_mem
    sudo fallocate -l $MY_SIZE"KB" ${MY_PATH}${FO_SYMB}_${MY_DATE}/${FI_NAME}_${MY_DATE}.${FI_EXE} 2>/dev/null
    echo "File: ${MY_PATH}${FO_SYMB}_${MY_DATE}/${FI_NAME}_${MY_DATE}.${FI_EXE} ${LOG_MY_DATE} ${MY_SIZE}KB">>logs.txt
    FI_NAME=$FI_NAME${FI_NAME: -1}
  done
  FI_NAME=$base_fi_name
  FO_SYMB=$FO_SYMB${FO_SYMB: -1}
done