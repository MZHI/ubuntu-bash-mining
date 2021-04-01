#!/bin/bash

SCRIPT_START_MINE=/home/user/scripts/start_mine.sh

# check if mining already started
mining_run=0
while read line; 
do
  val=$(echo $line | awk '{print $11}')
  if [[ $val == "SCREEN" ]]; then
    mining_run=$(($mining_run+1))
    break
  fi
done <<< "$(ps -aux | grep "mining")"

if [ $mining_run == 0 ]; then
  echo "mining not running, start new screen process"
  $SCRIPT_START_MINE
else
  echo "mining already running"
fi

