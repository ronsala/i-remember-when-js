# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Sessions' do
  it 'signs user in and out with username and password' do
    User.create(username: 'Sam', password: '123456', email: 'sam@example.com', bio: "Sam's bio....")
    post '/account/sign_in', params: { user: { email: 'sam@example.com', password: '123456' } }
    expect(response).to redirect_to user_path(1)
    expect(session).to be_truthy
    expect(current_user).to be_truthy
    get destroy_user_session_path
    expect(response).to redirect_to '/'
  end
end
