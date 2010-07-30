# Edit this Gemfile to bundle your application's dependencies.
source 'http://gemcutter.org'


gem "rails", "3.0.0.rc"

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
gem "mongoid", ">=2.0.0.beta6"
gem "bson_ext" # For mongoid
gem "devise", ">=1.1.1"
# gem "devise_invitable_paulrosania_tadatoshi", "0.4.0"
gem "rymai-devise_invitable", :require => "devise_invitable", :git => "git://github.com/rymai/devise_invitable.git", :branch => "edge"
gem "capistrano"
gem "leed_canada"

## Bundle gems used only in certain environments:
group :development do
  # TODO: Installing ruby-debug19 fails with Ruby 1.9.2 RC2:
  # gem "ruby-debug19", :require => "ruby-debug"
end

group :test do
  gem "rspec"
  gem "rspec-rails", ">=2.0.0.a5"
  gem "mongoid-rspec"
end
group :cucumber do
  gem "cucumber"
  gem "capybara"
  gem "database_cleaner"
  gem "cucumber-rails"
  gem "test-unit"
  gem "launchy"
  gem "selenium-client"
end
# group :test do
#   gem "webrat"
# end
group :production do
  gem "mysql2"
  gem "thin"
end
