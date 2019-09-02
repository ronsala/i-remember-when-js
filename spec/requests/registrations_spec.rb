require 'rails_helper'
RSpec.describe "Registrations" do
  it "signs user up" do
    # user = create(:user)    ## uncomment if using FactoryBot
    # user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") ## uncomment if not using FactoryBot
    # user = User.create(
    #   username: "Reggie",
    #   email: "reggie@example.com",
    #   password: "12345678",
    #   password_confirmation: "12345678",
    #   bio: "Now in registrations."
    # )
    post '/users', params: { user: {username: "Renee", email: "renee@example.com", password: "12345678", password_confirmation: "12345678", bio: "It all started a long time ago...."} }

    expect(response).to redirect_to user_path(1)
  end

  it "renders new template if user not created" do
    post '/users', params: { user: {username: "Renee", email: "renee@example.com", password: "", bio: "It all started a long time ago...."} }
    expect(response).to render_template("new")
  end
end