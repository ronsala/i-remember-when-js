require 'rails_helper'

RSpec.describe 'Creating account', type: :feature do
  it 'shows registration page' do
    visit root_path
    click_button('Sign up')
    expect(page).to have_text 'Sign Up'
  end
end