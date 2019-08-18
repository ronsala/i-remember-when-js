require 'rails_helper'

RSpec.describe Memory, type: :model do

  let (:user) {
    User.create(
      username: "Eve",
      email: "eve@example.com",
      password: "123", 
      bio: "In search of truth."
    )
  }

  let (:event) {
    Event.create(
      name: "The Big Event",
      country: "United States",
      day: 1,
      month: 5,
      year: 1985,
      description: "It was that big."
    )
  }

  let (:memory) {
    Memory.create(
      event_id: event.id,
      user_id: user.id,
      title: "My Earliest Memory", 
      body: "It was a dark and stormy night. Out stepped the captain...."
    )
  }

  it "is valid with event, user, title, body" do
    expect(memory).to be_valid
  end
end