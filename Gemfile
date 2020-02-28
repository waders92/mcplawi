source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap-sass', '~> 3.3.5.1'
gem 'carrierwave', '~> 1.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'figaro'
gem 'fog-aws'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'mini_magick'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.12'
gem 'rails', '~> 5.0.6'
gem 'rails_12factor', group: :production
gem 'rubocop', require: false
gem 'rubocop-rspec'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'sprockets'
gem 'stripe'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate', '~> 3.1.0'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.8'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
