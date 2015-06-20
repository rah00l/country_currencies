source 'http://rubygems.org'

gem 'rails', '3.2.22'
gem 'sqlite3'
gem 'mysql2'
gem 'savon'
gem 'nokogiri'
gem 'rack', '1.4.6'

group :development do
  gem 'capybara'
  gem 'database_cleaner'
  # gem 'rack-mini-profiler'
  gem 'devise'
  gem 'debugger'
end

group :test do
  # Code coverage for Ruby 1.9+ with a powerful configuration library and automatic merging of coverage across test suites
  gem 'simplecov', :require => false

  # JSON formatter for the ruby 1.9+ coverage gem SimpleCov 
  gem 'simplecov-json', :require => false

  # factory_girl is a fixtures replacement with a straightforward definition syntax
  # & factory_girl_rails provides Rails integration for factory_girl
  gem "factory_girl_rails", "~> 4.0"

  # For getting more descriptive BDD style test names
  # gem 'shoulda'

  # gem 'test-unit', '2.5.4'  
  # For stubbing & mocking 
  # gem "mocha",:require => false
  # gem "mocha", "~> 0.12.9", :require => false

  # gem 'guard'
  # Allows to automatically & intelligently launch tests when files are modified or created.
  # gem 'guard-test'

  gem 'minitest'
  gem 'minitest-spec-rails', '~> 4.7'#,require: false
  gem "minitest-colorize" # makes dots red/green and outputs failure info inline
  gem "minitest-focus"

  # To run test-case once file got save
  gem 'guard' # NOTE: this is necessary in newer versions
  gem 'guard-minitest'

  # In order to get terminal notification added following gems
  gem "terminal-notifier-guard"
  gem 'libnotify' # This is for linux os getting notifications
end

  gem "therubyracer", "~> 0.10.2"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "twitter-bootstrap-rails"
  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-rails', '3.1.3'
