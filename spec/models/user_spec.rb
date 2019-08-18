require 'rails_helper'

RSpec.describe User, type: :model do

  let (:user) {
    User.create!(
      username: "Mark",
      email: "mark@example.com",
      password: "123",
      bio: "Out of the wild in style."
    )
  }

  let (:admin) {
    User.create!(
      username: "Mandy",
      email: "mandy@example.com",
      password: "123",
      bio: "I rule!.",
      admin: true
    )
  }

  it "is valid with username, email, password, bio" do
    expect(user).to be_valid
  end

  it "is not valid without password" do
    expect(User.new(username: "MyName")).not_to be_valid
  end

  it "is valid with an admin boolean" do
    expect(admin).to be_valid
  end

  it "defaults to admin: false" do
    expect(user.admin).to eq(false)
  end

  it "has many rides" do
    
  end
end
