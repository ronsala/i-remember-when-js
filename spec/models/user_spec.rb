require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    
    10.times do
      user = User.new
      user[:username] = Faker::Internet.username
      user.save
    end
  end

  it "creates users" do
    expect(User.all.count).to eq(10)
  end
end
