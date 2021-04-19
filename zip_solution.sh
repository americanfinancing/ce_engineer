#!/bin/sh

BASEDIR="$( cd "$( dirname "$0" )" && pwd )"
cd ..

tar -zcvf solution.tar.gz --exclude="$BASEDIR/.git" $BASEDIR
mv solution.tar.gz "$BASEDIR/frontend"
cd $BASEDIR

# This is a hacky solution to bypass Gmail's native tar/gz file scanning
docker-compose run --rm runner gpg -c --batch --passphrase password solution.tar.gz

mv "$BASEDIR/frontend/solution.tar.gz.gpg" "$BASEDIR/solution.tar.gz.gpg" \
  && rm "$BASEDIR/frontend/solution.tar.gz"

echo 'solution.tar.gz.gpg has been written to the project root.'
