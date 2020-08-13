FROM node:14.7.0-alpine as node

RUN apk add --no-cache bash curl && \
    curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 1.22.4

FROM ruby:2.6.4-alpine

COPY --from=node /usr/local/bin/node /usr/local/bin/node
COPY --from=node /opt/yarn-* /opt/yarn
RUN ln -fs /opt/yarn/bin/yarn /usr/local/bin/yarn
RUN apk add --no-cache git build-base libxml2-dev libxslt-dev mysql-dev mysql-client tzdata bash less && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

ENV APP_ROOT /Contrail
RUN mkdir /Contrail
WORKDIR $APP_ROOT

ENV LANG=C.UTF-8

RUN gem update --system && \
    gem install --no-document bundler:2.1.4

COPY Gemfile /$APP_ROOT
COPY Gemfile.lock /$APP_ROOT
COPY . $APP_ROOT
