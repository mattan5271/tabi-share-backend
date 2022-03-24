source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"
gem "active_model_serializers"
gem "bcrypt"
gem "bootsnap", ">= 1.4.4", require: false
gem "carrierwave"
gem "dotenv-rails"
gem "enumerize"
gem "geocoder"
gem "jp_prefecture"
gem "listen", "~> 3.3"
gem "mini_magick"
gem "mysql2", "~> 0.5"
gem "net-imap"
gem "net-pop"
gem "net-smtp"
gem "puma", "~> 5.0"
gem "rack-cors"
gem "rails", "~> 6.1.4", ">= 6.1.4.4"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development do
  gem "capistrano"
  gem "capistrano3-puma"
  gem "capistrano-rails"
  gem "capistrano-rbenv"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec"
  gem "spring"
end

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
end
