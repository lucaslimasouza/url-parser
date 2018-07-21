FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /url-parser
WORKDIR /url-parser
COPY Gemfile /url-parser/Gemfile
COPY Gemfile.lock /url-parser/Gemfile.lock
RUN bundle install
COPY . /url-parser
