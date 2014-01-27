#!/bin/sh

mkdir Drafts 2>/dev/null

echo "xml2rfc version: " 
xml2rfc --version

for FILE in `ls -l`
do
    if test -d $FILE
    then
      echo "Entering Directory: $FILE"
      cd $FILE
      if [ "$FILE" = "Drafts" ]; then
          echo "Ignoring Drafts folder"
      else
          mkdir ../Drafts/$FILE
      fi
      
      for XMLFILE in `ls *.xml 2>/dev/null`
      do
          echo "Procsessing file: $XMLFILE"
          xml2rfc --date=`git log -1 --date=short --format=%cd $XMLFILE` -b ../Drafts/$FILE $XMLFILE --text --raw --html
          if [ $? -ne 0 ]
          then
              exit 1
          fi

      done
      cd ..
    fi
done


