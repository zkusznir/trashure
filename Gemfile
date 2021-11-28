# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 6.1.4", ">= 6.1.4.1"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use Puma as the app server
gem "puma", "~> 5.0"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"
# Use Active Model has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use Active Storage variant
# gem "image_processing", "~> 1.2"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

# Use RuboCop for beautiful code
gem "rubocop", "~> 1.23", require: false
gem "rubocop-rails", require: false

# Use Shrine for media upload
gem "shrine", "~> 3.0"

# Use dry-monads for use cases flow
gem "dry-monads", "~> 1.4.0"

# Use dry-validation for params validation
gem "dry-validation", "~> 1.7.0"

# Use jb for generating fast and simple JSON API responses
gem "jb", "~> 0.8.0"

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "pry", "~> 0.14.1"

  # Use RSpec for tests
  gem "rspec-rails", "~> 5.0.0"

  # Use FactoryBot for fixtures
  gem "factory_bot_rails", "~> 6.2.0"
end

group :development do
  gem "listen", "~> 3.3"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
end

group :test do
  # Use JSON Schema to validate API responses
  gem "json-schema", "~> 2.8.1"

  # Use Rubocop for RSpec
  gem "rubocop-rspec", "~> 2.6.0", require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
