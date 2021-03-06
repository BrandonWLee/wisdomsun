source 'https://rubygems.org'

gem 'rails', '3.2.14'
ruby "1.9.3"

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# BEFORE: gem 'sqlite3'
group :development, :test do
  gem 'sqlite3'
  gem 'debugger'
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'simplecov'
  gem "factory_girl_rails", "~> 4.0"
  gem 'railroady'
end
group :production do
  gem 'thin'
  gem 'pg'
end
group :test do
  gem 'cucumber-rails', :require => false
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer', '0.10.2', :platforms => :ruby
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '~> 2.3.0'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# haml
gem 'haml-rails'

# devise for user login authentication
gem 'devise'

# active-admin
gem 'activeadmin'

#file upload
gem "paperclip", "~> 3.5.2"
gem "paperclip-storage-ftp", "~> 1.1.0"

# rich text editor with paperclip support
gem 'redactor-rails-paperclip', git: "https://github.com/BrandonWLee/redactor-rails.git", tag: "wisdom-sun"
gem 'rmagick'

# email
gem 'mail'

# testing
gem 'selenium-webdriver'

# bulletin board
gem 'forem', :github => "radar/forem"
gem 'will_paginate', '3.0.4'
