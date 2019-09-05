require 'rails_helper'

RSpec.describe 'Creating account', type: :feature do
  it 'Shows registration page' do
    visit root_path
    click_button('Sign Up')
    expect(page).to have_text 'Sign Up'
  end
end