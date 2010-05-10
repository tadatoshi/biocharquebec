require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Auto-require default libraries and those for the current Rails environment.
Bundler.require :default, Rails.env

module Biocharquebec
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Add additional load paths for your own custom dirs
    # config.load_paths += %W( #{config.root}/extras )
    config.load_paths += %W( #{Rails.root}/lib/mailers #{Rails.root}/lib/delegate )

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
    # Added by tadatoshi because the one above causes an error "`[]': can't convert Pathname into String (TypeError)":
    # config.i18n.load_path += Dir[File.join(Rails.root, 'my', 'locales', '*.{rb,yml}')]
    # Added by tadatoshi in order to organize locale files based on http://guides.rails.info/i18n.html:
    config.i18n.load_path += Dir[File.join(Rails.root, 'config', 'locales', '**', '*.{rb,yml}')] 
    # config.i18n.default_locale = :de

    # Configure generators values. Many other options are available, be sure to check the documentation.
    # config.generators do |g|
    #   g.orm             :active_record
    #   g.template_engine :erb
    #   g.test_framework  :test_unit, :fixture => true
    # end

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters << :password

    # Your secret key for verifying the integrity of signed cookies.
    # If you change this key, all old signed cookies will become invalid!
    # Make sure the secret is at least 30 characters and all random, 
    # no regular words or you'll be exposed to dictionary attacks.
    config.secret_token = 'e62ec37b2d61e9d4aeca3e663a2646d4b126ea59e2915f9f95805f4b92290908a199c9a3065cdb1bc6b788473d5530be8e9a6a7cbd46dcd78716c3e81b040a63' 

    # Your secret key for verifying cookie session data integrity.
    # If you change this key, all old sessions will become invalid!
    # Make sure the secret is at least 30 characters and all random, 
    # no regular words or you'll be exposed to dictionary attacks.
    config.session_store :cookie_store, 
                         :key => '_biocharquebec_session',
                         :secret => 'a1b7aefd34983b91c1bc04a5d8e13dd3d6a0105b545f4c3c82328dad71a38ef124c02596da204de6c8c5961f3523cc85e542b3655b199957c455b38bfd23457a'
  end
end
