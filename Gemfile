# Edit this Gemfile to bundle your application's dependencies.
source 'http://gemcutter.org'


gem "rails", "3.0.0.beta3"

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
gem "mongo_mapper"
gem "mongo_ext"
gem "bson_ext" # For mongo_mapper
gem "devise", "1.1.rc1"
gem "capistrano"

## Bundle gems used only in certain environments:
group :test do
  gem "rspec"
  gem "rspec-rails", ">=2.0.0.a5"
end
group :cucumber do
  gem "cucumber"
  gem "capybara"
  gem "database_cleaner"
  gem "cucumber-rails"
  gem "test-unit"
  gem "launchy"
end
# group :test do
#   gem "webrat"
# end
group :production do
  gem "mysql"
  gem "thin"
end
