# frozen_string_literal: true

require 'rails_helper'
require 'devise'

RSpec.describe 'Sessions' do
  it 'signs user in and out with username and correct password' do
    User.create(username: 'Sam', password: '123456', email: 'sam@example.com', bio: "Sam's bio....")
    post '/users/sign_in', params: { user: { email: 'sam@example.com', password: '123456' } }
    expect(response).to redirect_to root_path
    follow_redirect!
    expect(response.body).to include('Sign Out')
    expect(session).to be_truthy
    get destroy_user_session_path
    expect(response.body).to_not include('Sign Out')
    expect(response).to redirect_to '/'
  end

  it 'does not sign user in with incorrect password' do
    get destroy_user_session_path
    User.create(username: 'Matt', password: '123456', email: 'matt@example.com', bio: "Matt's bio....")
    post '/users/sign_in', params: { user: { email: 'matt@example.com', password: '654321' } }
    expect(path).to eq new_user_session_path
    expect(response.body).to include('Sign In')
  end
end
