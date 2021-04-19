#!/bin/sh

BASEDIR="$( cd "$( dirname "$0" )" && pwd )"
cd ..

tar -zcvf solution.tar.gz --exclude="$BASEDIR/.git" $BASEDIR
mv solution.tar.gz $BASEDIR

echo 'solution.tar.gz has been written to the project root.'
