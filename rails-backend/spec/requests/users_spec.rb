# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  it 'renders index template' do
    get '/users'
    expect(response).to have_http_status(:success)
    expect(response).to render_template('index')
  end
end
