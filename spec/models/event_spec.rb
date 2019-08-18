require 'rails_helper'

RSpec.describe Event, type: :model do
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

  it "is valid with name, country, day, month, year, description" do
    expect(event).to be_valid
  end
end
