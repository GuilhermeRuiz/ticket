source 'http://rubygems.org'

gem 'rails', '3.1.0'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
end

gem 'gravatar_image_tag'
gem 'will_paginate'

group :development do
	gem 'rspec-rails'
	gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
	gem 'faker'
end

group :test do
	gem 'rspec'
	gem 'webrat'
	gem 'spork'
	gem 'factory_girl_rails'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

