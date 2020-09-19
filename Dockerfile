FROM ruby:2.6.4

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && apt-get install -y yarn --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update -qq && apt-get install -y default-mysql-client --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV APP_ROOT /Contrail
RUN mkdir /Contrail
WORKDIR $APP_ROOT

ENV LANG C.UTF-8

COPY Gemfile /$APP_ROOT
COPY Gemfile.lock /$APP_ROOT
RUN gem install bundler
RUN bundle install

COPY . $APP_ROOT

EXPOSE 3000

ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY}

ENV RAILS_ENV=production
RUN RAILS_ENV=production bundle exec rails assets:precompile

CMD ["bundle","exec","rails","server","puma","-b","0.0.0.0","-p","3000"]
