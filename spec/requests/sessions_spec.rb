# frozen_string_literal: true

require 'rails_helper'
require 'devise'

RSpec.describe 'Sessions' do
  it 'signs user in and out with username and correct password' do
    User.create(username: 'Sam', password: '123456', email: 'sam@example.com', bio: "Sam's bio....")
    post '/account/sign_in', params: { user: { email: 'sam@example.com', password: '123456' } }
    expect(response).to redirect_to user_path(1)
    expect(session).to be_truthy
    expect(session[:current_user]).to_not eq(nil)
    get destroy_user_session_path
    expect(response).to redirect_to '/'
  end

  it 'does not signs user in with incorrect password' do
    User.create(username: 'Matt', password: '123456', email: 'matt@example.com', bio: "Matt's bio....")
    post '/account/sign_in', params: { user: { email: 'matt@example.com', password: '654321' } }
    expect(response).to redirect_to new_user_session_path
    # expect(session).to be_falsey
    expect(session[:current_user]).to eq(nil)
    expect(response).to redirect_to new_user_session_path
  end
end
