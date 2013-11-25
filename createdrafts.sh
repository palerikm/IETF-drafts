#!/bin/bash


for FILE in `ls -l`
do
    if test -d $FILE
    then
      echo "Entering Directory: $FILE"
      cd $FILE
      for XMLFILE in `ls *.xml 2>/dev/null`
      do
          echo "Procsessing file: $XMLFILE"
          mkdir ../Drafts/$FILE
          xml2rfc -b ../Drafts/$FILE $XMLFILE --text --raw --html
      done
      cd ..
    fi
done


