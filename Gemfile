source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.0.rc2'
gem 'railties', '~> 6.0.0.rc2'
gem 'actionpack', '~> 6.0.0.rc2'
gem 'activerecord', '~> 6.0.0.rc2'
gem 'activesupport', '~> 6.0.0.rc2'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'jbuilder', '~> 2.7'
gem 'pg', '>= 0.18', '< 2.0'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'unicorn', '~> 5.5', '>= 5.5.1'

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
  gem 'rubocop', '~> 0.72.0'
  gem 'rubocop-performance', '~> 1.4'
end

group :development do
  gem 'annotate', '~> 2.7', '>= 2.7.5'
  gem 'better_errors', '~> 2.5', '>= 2.5.1'
  gem 'binding_of_caller', '~> 0.8.0'
  gem 'bullet', '~> 6.0', '>= 6.0.1'
  gem 'factory_bot_rails', '~> 5.0', '>= 5.0.2'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-byebug', '~> 3.7'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rack-proxy', '~> 0.6.5'
  gem 'seed-fu', '~> 2.3', '>= 2.3.9'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner', '~> 1.7'
  gem 'selenium-webdriver'
  gem 'simplecov', '~> 0.17.0'
  gem 'turnip', '~> 4.0', '>= 4.0.1'
  gem 'webdrivers', '~> 4.1'
end
