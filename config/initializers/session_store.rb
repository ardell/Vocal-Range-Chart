# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_vocal-range-chart_session',
  :secret      => 'cd9a54d704f5916a7fb7e5a3a6d6004a5300e7520dbf9b517a2bb43111cad59c8b0cd2c91cdc287e05cf3f28e624536a21e5fdcc7d67cec64d5a86b04f28c1a8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
