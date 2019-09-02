require 'rails_helper'
RSpec.describe "Sessions" do
  it "signs user in and out" do
    # user = create(:user)    ## uncomment if using FactoryBot
    # user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") ## uncomment if not using FactoryBot
    user = User.create(
      username: "Sam",
      email: "sam@example.com",
      password: "12345678",
      password_confirmation: "12345678",
      bio: "Now in session."
    )

    sign_in user
    # get root_path
    # expect(response).to render_template(:index) # add gem 'rails-controller-testing' to your Gemfile first.
    binding.pry
    expect(response).to redirect_to user_path(1)
    
    # sign_out user
    # get root_path
    # expect(response).not_to render_template(:index) # add gem 'rails-controller-testing' to your Gemfile first.
  end
end