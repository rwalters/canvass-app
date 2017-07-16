FROM ruby:2.4.0-slim

RUN apt-get update -qq \
  && apt-get install -qqy \
    build-essential \
    curl \
    libpq-dev \
    libxml2-dev \
  && apt-get -qq clean \
  && apt-get -qq autoremove \
  && rm -rf /var/lib/apt/lists/*

ENV APP_HOME=/app
WORKDIR $APP_HOME

COPY ./Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME/

EXPOSE 3000
