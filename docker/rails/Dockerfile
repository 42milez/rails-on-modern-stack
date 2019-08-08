FROM ruby:2.6.3

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE yes
ENV DEBCONF_NOWARNINGS yes

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && \
    apt-get install -qq -y build-essential \
                           libpq-dev \
                           nodejs \
                           postgresql-client \
                           yarn

ENV APP_ROOT /var/app
ENV DATABASE_HOST db

RUN mkdir $APP_ROOT

WORKDIR $APP_ROOT

ENV RAILS_ENV development

ADD Gemfile $APP_ROOT/Gemfile
ADD Gemfile.lock $APP_ROOT/Gemfile.lock

RUN gem install bundler:2.0.2

RUN bundle install -j4

ENV NODE_ENV development

ADD package.json $APP_ROOT/package.json
ADD yarn.lock $APP_ROOT/yarn.lock

RUN yarn install -g

EXPOSE 3000
EXPOSE 3035
