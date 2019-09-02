require 'rails_helper'
RSpec.describe "Sessions" do
  it "signs user in and out" do
    # user = create(:user)    ## uncomment if using FactoryBot
    user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") ## uncomment if not using FactoryBot
    User.create(
      username: "Sam",
      email: "sam@example.com",
      password: "12345678",
      password_confirmation: "12345678",
      bio: "Now in session."
    )

    post '/users/sign_in', params: { user: {username: "Sam", password: "12345678"} }
    expect(response).to redirect_to user_path(1)

    delete destroy_user_session_path
    expect(response).to redirect_to '/'
  end
end