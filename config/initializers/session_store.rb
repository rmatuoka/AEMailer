# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_aemailer_session',
  :secret      => 'c954c0bba77b73626a7fefbb6f00d853cddbab6620b26aa4521acc6ff6ddfe6e0171446fd1686f592fd8c38882825b2836a2d9ac401d494966bf687113fe91b6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
