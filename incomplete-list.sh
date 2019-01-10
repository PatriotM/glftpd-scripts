#!/bin/bash

# incomplete.sh version 0.3 coded by PatriotM 
# replaceable with the standard pzs-ng incomplete-list.sh

##############################
# CONFIG                     #
##############################
 
# enter path glftpd is installed in.
GLROOT=/mnt/ftpd

# enter section and path separated by pipe 
SECTIONS="
APPS|/site/APPS
DVDR|/site/DVDR
"

# minage to check the release
MINAGE=30
 
#############################
# END OF CONFIG             #
#############################
 
for LINE in ${SECTIONS}; do
  SECTION=$(echo ${LINE} | cut -d"|" -f1)
  FOLDER=$(echo ${LINE} | cut -d"|" -f2)
  test -d ${GLROOT}/${FOLDER} || { echo "ERROR: ${GLROOT}/${FOLDER} does not exist"; continue; }
  for RLS in $(find ${GLROOT}/${FOLDER}/ -maxdepth 1 -mindepth 1 -mmin +${MINAGE} -type l -exec realpath {} +); do
  PERCENT="`ls -1 "$RLS/" | sed -n 's/[^0-9]*\([0-9][0-9]*%\).*/\1/p'`"

  if [ -z "${PERCENT}" ]; then
    echo "$SECTION: $(basename $RLS) looks like without sfv file :-)"
  else
    echo "$SECTION: $(basename $RLS) with $PERCENT complete"
  fi
  done
done
