source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "rails", "~> 7.0.6"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "pundit"
gem "paranoia", "~> 2.6"

group :development, :test do
  gem "factory_bot_rails"
  gem "faker"
  gem "pry"
  gem "rspec-rails", "~> 6.0.0"
end

group :development do
  gem "web-console"
end

group :test do
  gem "shoulda-matchers", "~> 5.0"
end
