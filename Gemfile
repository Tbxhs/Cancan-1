source 'https://rubygems.org'

gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'haml'
gem 'twitter-bootstrap-rails'
gem 'jquery-rails'
gem 'gravtastic'

gem 'rspec-rails', :group => [:development,:test]
gem 'rb-fsevent', :group => :development
gem 'growl', :group => :development
gem 'guard-pow', :group => :development


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'


group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'factory_girl_rails' , '~> 1.1.0' ,:require => false
  gem 'database_cleaner', '>= 0.6.7'
  gem 'capybara','>= 1.1.1'
  gem 'launchy', '>= 2.0.5'
  gem 'guard-spork'
  gem 'spork', '~> 0.9.0'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'guard-bundler'
end
