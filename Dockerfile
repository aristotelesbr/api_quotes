FROM ruby:2.5.1

# Update and install deps
RUN apt-get update -qq && apt-get install -y \
build-essential libpq-dev

# Docker procedueres
RUN mkdir /api_quotes
WORKDIR /api_quotes
COPY Gemfile /api_quotes/Gemfile
COPY Gemfile.lock /api_quotes/Gemfile.lock
RUN bundle install
COPY . /api_quotes
EXPOSE 3000
