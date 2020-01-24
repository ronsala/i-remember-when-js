# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Registrations' do
  it "renders 'new' template" do
    get '/users/sign_up'
    expect(response).to have_http_status(:success)
    expect(response).to render_template('new')
  end

  it 'signs user up' do
    post '/users', params: { user: { username: 'Renee', email: 'renee@example.com', password: '12345678', password_confirmation: '12345678', bio: 'It all started a long time ago....' } }
    expect(response).to redirect_to root_path
    follow_redirect!
    expect(response.body).to include('renee@example.com')
  end

  it "renders 'new' template if user not created" do
    post '/users', params: { user: { username: 'Renee', email: 'renee@example.com', password: '', bio: 'It all started a long time ago....' } }
    expect(response).to render_template('new')
  end
end
