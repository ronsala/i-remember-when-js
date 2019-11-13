# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do

# https://stackoverflow.com/questions/15549204/omniauth-google-oauth2-with-devise-invalid-credentials-and-csrf-detected/15558450
# OmniAuth.config.full_host = "http://localhost:3000"

  # provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'] # TODO, scope: 'email'
  # provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]#, skip_jwt: true
end
