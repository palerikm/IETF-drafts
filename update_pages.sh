#!/bin/bash

./createdrafts.sh

git checkout gh-pages

./update.sh

git checkout master

