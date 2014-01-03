#!/bin/sh

mkdir Drafts 2>/dev/null

for FILE in `ls -l`
do
    if test -d $FILE
    then
      echo "Entering Directory: $FILE"
      cd $FILE
      mkdir ../Drafts/$FILE
      for XMLFILE in `ls *.xml 2>/dev/null`
      do
          echo "Procsessing file: $XMLFILE"
          xml2rfc -b ../Drafts/$FILE $XMLFILE --text --raw --html
          if [ $? -ne 0 ]
          then
              exit 1
          fi

      done
      cd ..
    fi
done


