# Edit this Gemfile to bundle your application's dependencies.
source 'http://gemcutter.org'


gem "rails", "3.0.0.beta2"

## Bundle edge rails:
# gem "rails", :git => "git://github.com/rails/rails.git"

# ActiveRecord requires a database adapter. By default,
# Rails has selected sqlite3.
gem "sqlite3-ruby", :require => "sqlite3"

## Bundle the gems you use:
# gem "bj"
# gem "hpricot", "0.6"
# gem "sqlite3-ruby", :require => "sqlite3"
# gem "aws-s3", :require => "aws/s3"
gem "authlogic", :git => "git://github.com/odorcicd/authlogic.git", :branch => "rails3"

## Bundle gems used only in certain environments:
group :test do
  gem "rspec"
  gem "rspec-rails", ">=2.0.0.a5"
end
group :cucumber do
  gem "cucumber"
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem "test-unit"
end
# group :test do
#   gem "webrat"
# end
