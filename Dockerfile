FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs

RUN mkdir /movie_platform
WORKDIR /movie_platform

COPY . /movie_platform

ENV BUNDLER_VERSION 2.0.2
RUN gem install bundler --version 2.0.2 && bundle install