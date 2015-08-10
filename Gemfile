ruby '2.2.2'
source 'https://rubygems.org'

gem 'rails', '4.2.3'
gem 'pg'
gem 'sorcery', '~> 0.9.1'
gem 'puma', '~> 2.12.3'
gem 'rollbar', '~> 2.1.1'

gem 'newrelic_rpm'

# Sidekiq
gem 'sidekiq', '~> 3.4.2'
gem 'sinatra', :require => nil
gem 'sidekiq-failures', '~> 0.4.5'

gem 'sass-rails', '5.0.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'slim-rails', '~> 3.0.1'
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass', '~> 3.3.5.1'
gem 'font-awesome-sass', '~> 4.3.2.1'
gem 'compass-rails', '~> 2.0.4'

gem 'will_paginate', '~> 3.0.7'
gem 'will_paginate-bootstrap'
gem 'local_time', '~> 1.0.2'

# Images
gem 'cloudinary', '~> 1.0.24'
gem 'attachinary', '~> 1.3.0'
gem 'responders', '~> 2.0' # This is needed for the old attachniary version


group :development, :test do
  gem 'better_errors'                   # Developer friendly error pages with useful env details
  gem 'binding_of_caller'               # REPL inside better_errors pages
  gem 'spring'
  gem 'quiet_assets'
  gem 'ffaker', github: 'ffaker/ffaker'
  gem 'dotenv-rails'
end


group :productio do
  gem 'rails_12factor', '~> 0.0.3'
end