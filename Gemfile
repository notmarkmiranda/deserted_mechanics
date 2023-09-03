source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "draper"
gem "importmap-rails"
gem "jbuilder"
gem "paranoia", "~> 2.6"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "pundit"
gem "rails", "~> 7.0.6"
gem "redis", "~> 4.0"
gem "skeleton-rails", git: "https://github.com/helios-technologies/skeleton-rails"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "factory_bot_rails"
  gem "faker"
  gem "pry"
  gem "rspec-rails", "~> 6.0.0"
  gem "standard-rails"
end

group :development do
  gem "letter_opener"
  gem "web-console"
end

group :test do
  gem "shoulda-matchers", "~> 5.0"
end
