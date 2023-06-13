#! /bin/bash

chmod +x trash.sh

if [[ !($1 =~ ^[a-zA-Z]{1,7}$) ]]; then
  echo "Argument 1: need only 1-7 simbols"
  exit
elif [[ !($2 =~ ^[a-zA-Z]{1,7}\.[a-zA-Z]{1,3}$) ]]; then
  echo "Argument 2: need only simbols and point. 1-7 for name, point, 1-3 for extension"
elif [[ !($3 =~ ^[0-9]+Mb$) ]]; then
  exit
  echo "Argument 3: need only positive number and "Mb""
elif [[ ${3%Mb} -lt 1 || ${3%Mb} -gt 100 ]]; then
  echo "Argument 3: need only 1-100 number"
  exit
else
  export FOL_NAME="$1"
  export FI_NAME="${2%.*}"
  export FI_EXE="${2#*.}"
  export MY_SIZE="${3%Mb}"

  while [[ ${#FOL_NAME} -lt 5 ]]; do
    export FOL_NAME=$FOL_NAME${FOL_NAME: -1}
  done
  while [[ ${#FI_NAME} -lt 5 ]]; do
    export FI_NAME=$FI_NAME${FI_NAME: -1}
  done
  export base_fi_name=$FI_NAME

  ./trash.sh

fi
