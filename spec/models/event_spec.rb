# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    @event1 = Event.create(
      name: 'The Big Event',
      country: 'United States',
      date: Faker::Date.between(from: 120.years.ago, to: Date.today),
      description: 'It was that big.'
    )

    @user1 = User.create(
      username: 'Lexi',
      email: 'lexi@example.com',
      password: '12345678',
      password_confirmation: '12345678',
      bio: 'In search of truth.'
    )

    @user2 = User.create(
      username: 'Eve',
      email: 'eve@example.com',
      password: '12345678',
      password_confirmation: '12345678',
      bio: 'In search of experience.'
    )

    @memory1 = Memory.create(
      event_id: @event.id,
      user_id: @user1.id,
      title: 'My Earliest Memory',
      body: 'It was a dark and stormy night. Out stepped the captain....'
    )

    @memory2 = Memory.create(
      event_id: @event.id,
      user_id: @user2.id,
      title: 'Life Changing',
      body: 'Best speech ever!'
    )
  end

  it 'is valid with name, country, date, description' do
    expect(@event).to be_valid
  end

  it 'validates year selected' do
    expect(Event.create(
      name: 'The Big Event',
      country: 'United States',
      date: 'Select',
      description: 'It was that big.'
    )).not_to be_valid
  end

  it 'has many memories' do
    expect(@event.memories.first).to eq(@memory1)
    expect(@event.memories.last).to eq(@memory2)
  end

  it 'has many users through memories' do
    expect(@event.users.first).to eq(@user1)
    expect(@event.users.last).to eq(@user2)
  end
end
