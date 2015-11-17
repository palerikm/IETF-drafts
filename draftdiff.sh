#!/bin/sh


DRAFT=$2

mkdir tmp

xml2rfc $DRAFT.xml -o tmp/$DRAFT.new
git checkout master~$1 $DRAFT.xml
xml2rfc $DRAFT.xml -o tmp/$DRAFT.old
git checkout master $DRAFT.xml


rfcdiff tmp/$DRAFT.new tmp/$DRAFT.old
