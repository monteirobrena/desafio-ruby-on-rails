FROM ruby:2.6.3
MAINTAINER monteirobrena@gmail.com

RUN sed -i '/jessie-updates/d' /etc/apt/sources.list

# Dependencies
RUN apt-get update -qq \
    && apt-get install -y \
    build-essential \
    libpq-dev \
    ruby-dev \
    zlib1g-dev \
    nodejs \
    npm \
    curl

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ rc main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install yarn

# Bundler
RUN gem install bundler --no-doc

# Project setup
RUN mkdir /transactions_store
WORKDIR /transactions_store
ADD Gemfile /transactions_store/Gemfile
ADD Gemfile.lock /transactions_store/Gemfile.lock
RUN bundle install
RUN yarn install

COPY . /transactions_store

