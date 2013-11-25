#!/bin/bash

./createdrafts.sh

git add Drafts
git commit -a -m "Sync Drafts folder with source xml files"


# Switch to gh-pages branch to sync it with master
###################################################################
git checkout gh-pages

./update.sh

git checkout master

