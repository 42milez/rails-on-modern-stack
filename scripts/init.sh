#!/usr/bin/env bash

#  Ensure Yarn exists
# --------------------------------------------------

yarn -v > /dev/null 2>&1

if [[ $? -eq 127 ]]; then
  echo 'error: yarn not found'
  exit $?
fi

#  Install front-end packages
# --------------------------------------------------

yarn install

#  Install gems
# --------------------------------------------------

bundle install -j4 --path=vendor/bundle --binstubs=vendor/bin

#  Initialize project
# --------------------------------------------------

bundle exec rails new . --database=postgresql \
                        --skip \
                        --skip-bundle \
                        --skip-coffee \
                        --skip-gemfile \
                        --skip-git \
                        --skip-javascript \
                        --skip-puma \
                        --skip-sprockets \
                        --skip-turbolinks \
                        --skip-yarn

if [[ $? -ne 0 ]]; then
    echo 'error: initialization failed'
    exit $?
fi

rm -f bin

rm -f log

rm -f public/*.html
rm -f public/*.png
rm -f public/favicon.ico
rm -f public/robots.txt

touch public/.keep

cp defaults/app/helpers/*.rb app/helpers/

cp defaults/app/views/layouts/*.html.erb app/views/layouts/

cp defaults/config/environments/development.rb config/environments/

cp defaults/config/initializers/*.rb config/initializers/

cp defaults/config/database.yml config/

cp defaults/config/unicorn.rb config/

rm -rf app/assets

mkdir frontend \
      frontend/components \
      frontend/images \
      frontend/init \
      frontend/pages

touch frontend/components/.keep \
      frontend/images/.keep \
      frontend/init/.keep \
      frontend/pages/.keep

cp defaults/webpack.config.js .
