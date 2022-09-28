source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

gem 'font-awesome-rails', '< 5.1'

gem 'rails', '~> 6.1.6', '>= 6.1.6.1'


gem 'puma', '~> 3.11'

gem 'turbolinks', '~> 5'

gem 'jbuilder', '~> 2.5'

gem 'bcrypt', '~> 3.1.7'

gem 'gravtastic'
gem 'recaptcha', require: 'recaptcha/rails'

gem 'webpacker', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'

gem 'bootsnap', '>= 1.4.4', require: false

gem "where_exists", "~> 2.0"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

group :production do
  gem 'pg'
end

gem "bullet", "~> 7.0"
