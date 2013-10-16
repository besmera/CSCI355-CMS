#!/bin/sh

if [ $# -eq 1 ]
	then
        echo "Trying to start assignment part $1"    
    else
        echo "Invalid argument(s).  Specify assignment for example, 'sh start_assignment.sh 2'"
		exit
fi

echo "Fetching remote code"
RESULT=$(git fetch)

echo "Checking out assignment part $1"
RESULT=$(git checkout $1)
BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

if [[ $1 == $BRANCH ]];
    then
        echo "No error"
    else
        #Not neccessary but just to be safe
        RESULT=$(git checkout master)  
        echo "--------------------------------------"
        echo "Could not find assignment part $1 please be sure you entered the assignment part correctly." 
        echo "--------------------------------------"
        exit
fi

echo "Running setup script for part $1"
sh setup.sh