# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Memory, type: :model do
  let(:user) do
    User.create(
      username: 'Eve',
      email: 'eve@example.com',
      password: '12345678',
      password_confirmation: '12345678',
      bio: 'In search of truth.'
    )
  end

  let(:event) do
    event = Event.create(
      name: 'The Big Event',
      country: 'United States',
      date: Faker::Date.between(from: 120.years.ago, to: Date.today),
      description: 'It was that big.'
    )
  end

  let(:memory) do
    Memory.create(
      event_id: event.id,
      user_id: user.id,
      title: 'My Earliest Memory',
      body: 'It was a dark and stormy night. Out stepped the captain....'
    )
  end

  it 'is valid with event, user, title, body' do
    expect(memory).to be_valid
  end

  it 'belongs to one user' do
    expect(memory.user).to eq(user)
  end

  it 'belongs to one event' do
    expect(memory.event).to eq(event)
  end
end
