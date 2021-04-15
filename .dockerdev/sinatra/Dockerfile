ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION-slim-buster

ARG BUNDLER_VERSION

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
