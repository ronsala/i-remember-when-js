# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Sessions' do


  
  it 'signs user in and out with username and password' do
    post '/users/sign_in', params: { user: { username: 'Sam', password: '12345678' } }
    expect(response).to redirect_to user_path(1)
    expect(session).to be_truthy
    binding.pry
    delete destroy_user_session_path
    expect(response).to redirect_to '/'
  end
end
