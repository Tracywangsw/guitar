FROM ruby:2.2

RUN apt-get update && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for a JS runtime
RUN apt-get install -y nodejs npm && ln -sf /usr/bin/nodejs /usr/bin/node

# for bower
RUN npm install -g bower

RUN apt-get install -y rsync

# admin tools
RUN apt-get install -y vim

#for crontab
# RUN apt-get install -y cron

# make node modules bin available on path
ENV PATH $PATH:./node_modules/.bin

# Override base image's bundler config.
# This saves `bundle install`'s result in app's directory, so next time we launch a new container we cna `bundle exec` without doing `bundle install` again.
ENV BUNDLE_APP_CONFIG=.bundle


WORKDIR /
# service management scripts
ADD run.sh /run.sh

# use -l for login shell. This ensures that ~/.bashrc is read.
CMD bash /run.sh
