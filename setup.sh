#!/bin/sh

docker-compose down \
  && rm -f frontend/db/*.sqlite3 \
  && docker-compose build \
  && docker-compose run --rm api bundle install \
  && docker-compose run --rm rails bundle install \
  && docker-compose run --rm rails bundle exec rails db:create db:migrate db:seed \
  && docker-compose run --rm rails bundle exec yarn install
