#!/bin/bash
# Parameters
BASEDIR=$(dirname $0)
CURDIR=$(pwd)
MAILDIR=./maildata
ATTACH_DIR=./attachments
# change directory
echo "Switching directory to : $BASEDIR"
cd $BASEDIR
# fetch mail
echo "Checking for new mail..."
fetchmail -f ./fetchmail.conf
# process new mails
shopt -s nullglob
for i in $MAILDIR/new/*
do
  echo "Processing : $i"
  uudeview $i -i -p $ATTACH_DIR/
  for x in $ATTACH_DIR/*.pdf
  do
          echo "Printing : $x"
          lp $x
          echo "Deleting file : $x"
          rm $x
  done
  echo "Clean up and remove any other attachments"
  for y in $ATTACH_DIR/*
  do
          rm $y
  done
  # delete mail
  echo "Deleting mail : $i"
  rm $i
done
shopt -u nullglob
echo "Job finished."

now=$(date +"%T")
echo "Last Run: $now"

cd $CURDIR
