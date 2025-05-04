source "https://rubygems.org"

ruby file: ".ruby-version"

# Use specific branch of Rails
gem "rails", github: "rails/rails", branch: "8-0-stable"
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.5", ">= 1.5.9"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.6"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.14"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end

# mission control
gem "mission_control-jobs", "~> 1.0", ">= 1.0.2"

# redis
gem "redis", "~> 5.4"
gem "hiredis-client", "~> 0.24.0"

# autentication
gem "devise", "~> 4.9", ">= 4.9.4"
# omniauth authentication
gem "omniauth", "~> 2.1", ">= 2.1.3"
gem "omniauth-rails_csrf_protection", "~> 1.0", ">= 1.0.2"
gem "omniauth-google-oauth2", "~> 1.2", ">= 1.2.1" # google
gem "omniauth-facebook", "~> 10.0" # facebook
gem "omniauth-microsoft_graph", "~> 2.0", ">= 2.0.1" # microsoft

# localization
gem "rails-i18n", "~> 8.0", ">= 8.0.1" # rails localization
gem "devise-i18n", "~> 1.13" # devise localization

gem "amazing_print", "~> 1.7", ">= 1.7.2" # pretty print

# misc gems
gem "simple_form", "~> 5.3", ">= 5.3.1" # forms
gem "redcarpet", "~> 3.6", ">= 3.6.1" # markdown
gem "figaro", "~> 1.2" # env variables
gem "faraday", "~> 2.12", ">= 2.12.2" # faraday
gem "prefixed_ids", "~> 1.8", ">= 1.8.1" # prefixed ids
gem "flash_rails_messages", "~> 2.3" # flash messages
gem "pagy", "~> 9.3", ">= 9.3.4" # pagination
gem "view_component", "~> 3.22" # view components
gem "recaptcha", "~> 5.19" # recaptcha
gem "htmlcompressor", "~> 0.4.0" # html compressor

gem "sentry-ruby"
gem "sentry-rails"

group :development do
  gem "bullet", "~> 8.0", ">= 8.0.1"
  gem "letter_opener_web", "~> 3.0" # letter opener web

  gem "pry", "~> 0.15.0" # pry
  gem "hotwire-livereload", "~> 2.0" # livereload
  gem "debugbar", "~> 0.4.3"
end

group :development, :test do
  gem "factory_bot_rails", "~> 6.4", ">= 6.4.4"
end
