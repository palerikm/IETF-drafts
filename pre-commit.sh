#!/bin/sh

# run script to check if commit is valid
./createdrafts.sh
RETVAL=$?

if [ $RETVAL -ne 0 ]
then
  exit 1
fi
