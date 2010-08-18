# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_codex_session',
  :secret      => 'd5564c2aa081c863585ed7d399496bf4e263355612d87ea58303c1d6589b3bc8bd1f9a2d4587b3fe1206b9041d1d614b74db323650ab8c6b6e812397d53f4af1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
