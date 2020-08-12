FROM ruby:2.6.4-alpine

ENV APP_ROOT /Contrail \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

RUN mkdir /Contrail
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock

RUN apk update && \
    apk add --no-cache \
        gcc \
        g++ \
        libc-dev \
        libxml2-dev \
        linux-headers \
	libc-dev \
	libxslt-dev \
	libxml2-dev \
	mysql-dev \
	mysql-client \
	tzdata \
	yarn && \
    apk add --virtual build-packs --no-cache \
	build-base \
    gem install bundler && \
    bundle install && \
    apk del build-packages && \
    rm -rf /usr/lib/mysqld* \
        /usr/bin/mysql* \
        /usr/local/bundle/cache/* \
        /usr/local/share/.cache/*

RUN gem install nokogiri
	
RUN mkdir -p $APP_ROOT/tmp/sockets

COPY . $APP_ROOT

