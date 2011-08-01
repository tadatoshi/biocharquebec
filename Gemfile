source 'http://rubygems.org'

gem "rails", "3.1.0.rc5"

## Bundle edge rails:
# gem "rails", :git => "git://github.com/rails/rails.git"

# ActiveRecord requires a database adapter. By default,
# Rails has selected sqlite3.
gem "sqlite3", :require => "sqlite3"

# Asset template engines
gem 'sass'
gem 'coffee-script'
gem 'uglifier'

## Bundle the gems you use:
# gem "bj"
# gem "hpricot", "0.6"
# gem "sqlite3-ruby", :require => "sqlite3"
# gem "aws-s3", :require => "aws/s3"
gem "mongoid", ">=2.0.0.rc.7"
gem "bson_ext", ">=1.2.0" # For mongoid
gem "devise", "~> 1.1.2"
# gem "devise_invitable", :git => "git://github.com/rymai/devise_invitable.git"
gem "capistrano"
# gem "leed_canada"
gem "carrierwave-rails3", :require => "carrierwave"
gem "mini_magick"
gem "jasmine", :group => [:development, :test]

## Bundle gems used only in certain environments:
group :development, :test do
  gem "rspec-rails"
end

group :development do
  # TODO: Installing ruby-debug19 fails with Ruby 1.9.2 RC2:
  # gem "ruby-debug19", :require => "ruby-debug"
  gem 'ruby-debug-base19', "0.11.24"
  gem 'ruby-debug19', "0.11.6"
end

group :test do
  # gem "mongoid-rspec"
  gem "rspec_extensions_collection"
  gem "factory_girl_rails", ">=1.1.beta1"
end

group :cucumber do
  gem "cucumber-rails"
  gem "capybara"
  gem "database_cleaner"
  gem "cucumber-rails"
  gem "test-unit"
  gem "launchy"
  gem "selenium-client"
end

group :staging, :production do
  gem "mysql2"
  gem "passenger"
end

gem "simplecov", :require => false, :group => :test 