FROM ruby:2.3.0-alpine

ENV APP_HOME /app
RUN mkdir $APP_HOME
RUN apk --no-cache add --update \
  alpine-sdk \
  libxml2-dev \
  libxslt-dev \
  nodejs \
  postgresql-dev

WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
RUN bundle config build.nokogiri --use-system-libraries \
  bundle install

ADD . $APP_HOME
