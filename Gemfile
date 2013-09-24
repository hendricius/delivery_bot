# For heroku
ruby "2.0.0"

source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.0.0'
gem 'sprockets-rails', :require => 'sprockets/railtie', git: "https://github.com/hendricius/sprockets-rails.git"
gem 'bcrypt-ruby'

# Use Slim as the markup language
gem 'slim'
gem "slim-rails", "~> 1.1.1"

# Use SASS for stylesheets
gem 'sass-rails', git: 'https://github.com/rails/sass-rails.git', branch: :master

gem 'simple_form', '3.0.0.rc'

# Adding CSS3 mixin support.
gem 'bourbon'

# Use bootstrap as the style framework
gem "twitter-bootstrap-rails"

# Font awesome for pretty html icons.
gem 'font-awesome-rails', git: 'https://github.com/bokmann/font-awesome-rails.git'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'therubyracer'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

# Nil empty strings
gem "nilify_blanks"

# HTTParty for querying ports
gem 'httparty'

# Database of countries
gem 'countries'

# Handling money
gem 'money'

# Bootstrap helpers
gem "rails-bootstrap-helpers", git: "https://github.com/hendricius/rails-bootstrap-helpers"

# Pagination
gem 'will_paginate', '~> 3.0'
gem 'will_paginate-bootstrap'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do
  # Use Postgres as the database for Active Record
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'thin'
  gem 'pry'
  gem 'guard-minitest'
  gem 'minitest-rails'
  gem 'quiet_assets'
  gem 'timecop'
  gem 'railroady'
  gem 'guard-livereload'
end
