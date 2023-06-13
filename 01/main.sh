#! /bin/bash

chmod +x parse.sh

if [[ $# != 6 ]]; then
  echo "Need six argument"
elif [[ !($1 =~ /$) ]]; then
  echo "Need to white path (.../)"
elif [[ !(-d "$1") ]]; then
  echo "Directory not exist"
elif [[ !($2 =~ ^[0-9]+$) ]]; then
  echo "Argument 2: need only positive number"
elif [[ $2 -eq 0 ]]; then
  echo "Argument 2: number of folders must be more then zero"
elif [[ !($3 =~ ^[a-zA-Z]{1,7}$) ]]; then
  echo "Argument 3: need only 1-7 simbols"
elif [[ !($4 =~ ^[0-9]+$) ]]; then
  echo "Argument 4: need only positive number"
elif [[ $4 -eq 0 ]]; then
  echo "Argument 4: numbers of files must be more than zero"
elif [[ !($5 =~ ^[a-zA-Z]{1,7}\.[a-zA-Z]{1,3}$) ]]; then
  echo "Argument 5: need only simbols and point. 1-7 for name, point, 1-3 for extension"
elif [[ !($6 =~ ^[0-9]+kb$) ]]; then
  echo "Argument 6: need only positive number and "kb""
elif [[ ${6%kb} -lt 1 || ${6%kb} -gt 100 ]]; then
  echo "Argument 6: need only 1-100 number"
else
  export MY_PATH="$1"
  export FOLDERS="$2"
  export FO_SYMB="$3"
  export FILES="$4"
  export FI_NAME="${5%.*}"
  export FI_EXE="${5#*.}"
  export MY_SIZE="${6%kb}"
  
  ./parse.sh
fi
