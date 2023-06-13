#! /bin/bash

>log.txt

chmod +x parse.sh

START_DATE="$(date +"%d.%m.%y %H:%M:%S")"

export START_SEC=$(date +%S)
export START_NANO=$(date +%N)
export START=$(echo "scale=2; $START_NANO/1000000000+$START_SEC" | bc)

export NAME_DATE="$(date +"%d%m%y")"
export LOG_DATE="$(date +"%d.%m.%y")"
if [[ $# != 3 ]]; then
  echo "Need three argument"
  exit
fi

./parse.sh $1 $2 $3
FINISH_DATE="$(date +"%d.%m.%y %H:%M:%S")"

echo "Started: $START_DATE"
echo "Started: $START_DATE" >> log.txt
echo "Finished: $FINISH_DATE"
echo "Finished: $FINISH_DATE" >> log.txt

export FINISH_SEC=$(date +%S)
export FINISH_NANO=$(date +%N)
export FINISH=$(echo "scale=2; $FINISH_NANO/1000000000+$FINISH_SEC" | bc)
time=$(echo "$FINISH-$START" | bc)
if [[ $time =~ ^\. ]]; then
  point=0
fi
echo "Script execution time = $point$time second"
echo "Script execution time = $point$time second" >> log.txt


