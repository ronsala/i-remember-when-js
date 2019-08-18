require 'rails_helper'

RSpec.describe User, type: :model do

  # it "creates users" do
  #   10.times do
  #     user = User.new
  #     user[:username] = Faker::Internet.username
  #     user.save
  #   end
  #   expect(User.all.count).to eq(10)
  # end

  let (:user) {
    User.create(
      username: "Mark",
      email: "mark@example.com",
      password: "123",
      bio: "Out of the wild in style."
    )
  }

  it "is valid with username, email, password, bio" do
    expect(user).to be_valid
  end

  # it "creates an admin" do
  #   admin = User.create(username: "Mandy", admin: true)

  # end
end
