#!/bin/bash

SHELL=/bin/bash
PATH= # TODO fill this

# check if any user from list is authorized
SCRIPT_CHECK=ubuntu-bash-mining/check_mining.sh
SCRIPT_STOP=ubuntu-bash-mining/stop_mining.sh
USERS=("user1" "user2" "user3") # TODO set your list of users
ANY="no"
for usr in ${USERS[@]}; do
        echo "Checking user $usr ..."
        if [ -z $( who -H | grep $usr ) ]
        then
                echo "Not logged in!"
        else
                echo "Logged in!"
                ANY="yes"
        fi
done
if [ $ANY == "no" ]
then
        echo "Nobody from list of users is logged in, so checking for mining"
        $SCRIPT_CHECK
else
        echo "Mining stop!"
        $SCRIPT_STOP
fi

