source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3'

#20120411herokuデプロイstart

gem 'sqlite3', :group => [:development, :test]
group :production do
    gem 'pg'
end

#gem 'activerecord-postgresql-adapter'
#20120411herokuデプロイ end
#
gem 'json'

gem "twitter-bootstrap-rails"

group :development, :test do
  gem 'rspec-rails'
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
# gem 'ruby-debug'

