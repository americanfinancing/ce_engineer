ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION-slim-buster

ARG NODE_MAJOR
ARG BUNDLER_VERSION
ARG YARN_VERSION

# Common dependencies
RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    curl \
    less \
    git \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -

# Add Yarn to the sources list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

# Install dependencies
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    libsqlite3-dev \
    nodejs \
    yarn=$YARN_VERSION-1 \
    vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

# Configure Bundler
ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

# Upgrade RubyGems and install required Bundler version
RUN gem update --system --silent \
  && rm /usr/local/lib/ruby/gems/*/specifications/default/bundler-*.gemspec \
  && gem uninstall bundler \
  && gem install bundler -v $BUNDLER_VERSION

# Create a directory for the app code
RUN mkdir -p /opt/app

WORKDIR /opt/app

