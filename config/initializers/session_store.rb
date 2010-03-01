# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_biocharquebec_session',
  :secret => 'a1b7aefd34983b91c1bc04a5d8e13dd3d6a0105b545f4c3c82328dad71a38ef124c02596da204de6c8c5961f3523cc85e542b3655b199957c455b38bfd23457a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
