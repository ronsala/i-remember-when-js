# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating account with username and password', type: :feature do
  it 'Shows registration page' do
    visit root_path
    click_link 'Sign Up'
    expect(page).to have_text 'Sign Up'
  end

  it "Shows user's page" do
    visit new_user_registration_path
    fill_in 'Username', with: 'John'
    fill_in 'Email', with: 'John@example.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Retype Password', with: '12345678'
    fill_in 'Bio', with: 'From bewilderment to enlightenment.'
    click_button 'Sign Up'
    expect(page).to have_text 'John'
  end
end
