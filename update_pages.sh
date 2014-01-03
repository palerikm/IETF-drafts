#!/bin/sh



echo -e "Starting to update gh-pages\n"


git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis"

git clone --branch gh-pages https://${GH_TOKEN}@github.com/Draft-Mafia/IETF-drafts.git DraftStorage


cp -r Drafts/* DraftStorage

cat start.html > index.html
rm content.html

cd DraftStorage
for FILE in `ls -l`
do
    if test -d $FILE
    then
      #echo "Entering Directory: $FILE"
      echo "<h3> $FILE </h3>" >> ../content.html
      cd $FILE
      for HTMLFILE in `ls *.html 2>/dev/null`
      do
          #echo "Procsessing file: $HTMLFILE"
          echo "<p>" >> ../../content.html
          echo "${HTMLFILE%%.*} <a href=DraftStorage/$FILE/$HTMLFILE> [html] </a>" >> ../../content.html
          echo "<a href=DraftStorage/$FILE/${HTMLFILE%%.*}.txt> [txt] </a>" >> ../../content.html
          echo "<a href=DraftStorage/$FILE/${HTMLFILE%%.*}.raw.txt> [raw.txt] </a>" >> ../../content.html
          echo "</p>" >> ../../content.html
      done
      cd ..
    fi
done
cd ..

cat content.html >>index.html
cat end.html >>index.html



git add -A DraftStorage
git commit -a -m "Travis build $TRAVIS_BUILD_NUMBER pushed to gh-pages"
git push -f origin gh-pages

echo -e "Finishing to update gh-pages\n"
