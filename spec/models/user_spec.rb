require 'rails_helper'

RSpec.describe User, type: :model do
  
  before (:each) do

    @event1 = Event.create(
      name: "The Big Event",
      country: "United States",
      day: 1,
      month: 5,
      year: 1985,
      description: "It was that big."
    )

    @event2 = Event.create(
      name: "The Big Event",
      country: "United States",
      day: 1,
      month: 5,
      year: 1985,
      description: "It was that big."
    )

    @user1 = User.create(
      username: "Lexi",
      email: "lexi@example.com",
      password: "123", 
      bio: "In search of truth."
    )

   @user2 = User.create(
      username: "Eve",
      email: "eve@example.com",
      password: "123", 
      bio: "In search of experience."
    )

    @admin1 = User.create!(
        username: "Mandy",
        email: "mandy@example.com",
        password: "123",
        bio: "I rule!.",
        admin: true
      )
  
    @memory1 = Memory.create(
      event_id: @event1.id,
      user_id: @user1.id,
      title: "My Earliest Memory", 
      body: "It was a dark and stormy night. Out stepped the captain...."
    )

   @memory2 = Memory.create(
      event_id: @event2.id,
      user_id: @user1.id,
      title: "Life Changing", 
      body: "Best speech ever!"
    )
  end

  it "is valid with username, email, password, bio" do
    expect(@user1).to be_valid
  end

  it "is not valid without password" do
    expect(User.new(username: "MyName")).not_to be_valid
  end

  it "is valid with an admin boolean" do
    expect(@admin1).to be_valid
  end

  it "defaults to admin: false" do
    expect(@user1.admin).to eq(false)
  end

  it "has many memories" do
    expect(@user1.memories.first).to eq(@memory1)
    expect(@user1.memories.last).to eq(@memory2)

  end

  it "has many events through memories" do
    expect(@user1.events.first).to eq(@event1)
    expect(@user1.events.last).to eq(@event2)
  end
end
