# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
# Added by tadatoshi:
require 'database_cleaner'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # Commented out by tadatoshi because running spec caused an error "undefined method `fixture_path='" 
  # and because fixtures are not used:
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # Commented out by tadatoshi because running spec caused an error "undefined method `use_transactional_fixtures='":
  # config.use_transactional_fixtures = true
  
  # Added by tadatoshi:
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  # Added by tadatoshi:
  config.before(:each) do
    DatabaseCleaner.start
  end

  # Added by tadatoshi:
  config.after(:each) do
    DatabaseCleaner.clean
  end  
  
  # Added by tadatoshi. For Devise:
  config.include Devise::TestHelpers, :type => :controller  
  
  # Added by tadatoshi:
  config.include RSpecExtensionsCollection::Matchers::MongoidModelHelpers
  config.include RSpecExtensionsCollection::Matchers
end