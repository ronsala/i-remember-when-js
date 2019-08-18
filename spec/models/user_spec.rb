require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    # DatabaseCleaner.clean
  
    # 10.times do
    #   user = User.new(username: Faker::Internet.username, email: Faker::Internet.safe_email, password: Faker::Internet.password, bio: Faker::Lorem.paragraph)
    #   # binding.pry
    #   user.save
    # end

    10.times do
      user = User.new
      user[:username] = Faker::Internet.username
      user.save
    end
  end

  it "creates users" do
    # binding.pry
    expect(User.all.count).to eq(10)
  end
end
