FROM ruby:2.2.4-alpine

ENV APP_HOME /app
RUN mkdir $APP_HOME
RUN apk --no-cache add --update \
  alpine-sdk \
  libxml2-dev \
  libxslt-dev \
  nodejs \
  postgresql-dev
RUN bundle config build.nokogiri --use-system-libraries

WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
RUN bundle install

COPY . $APP_HOME
RUN cp $APP_HOME/config/database.docker.yml $APP_HOME/config/database.yml
