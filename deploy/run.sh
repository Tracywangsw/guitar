#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# This prevents tools from asking you stupid questions. e.g. Bower.
# See: https://github.com/bower/bower/issues/1102
export CI=true

if [ ! -e $RAILS_ROOT ]; then
  echo create rails root dir at $RAILS_ROOT
  mkdir -p $RAILS_ROOT
fi


cd $RAILS_ROOT

# Update repo
if [ ! -d ".git" ]; then
  echo Cloning $GIT_REPO
  git clone $GIT_REPO .
else
  echo Pulling $GIT_REPO
  git reset --hard && git pull -f
fi


# Sidekiq needs this dir
echo create tmp/pids
mkdir -p tmp/pids

# dependencies
if [ -e "package.json" ]; then
  npm install
fi

if [ -e "bower.json" ]; then
  bower install --allow-root
fi
bundle install --deployment --without test development


# migrations
bundle exec rake db:create
bundle exec rake db:migrate

if [[ $RAILS_ENV == "production" ]]; then
  rake assets:precompile
fi

rails s -b 0.0.0.0
