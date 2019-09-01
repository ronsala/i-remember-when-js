require 'rails_helper'

RSpec.describe "User requests", type: :request do

  describe "GET index" do
    it "renders index template" do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response).to render_template("index")
    end
  end

  describe "GET new" do
    it "renders the new template" do
      get '/users/new'
      expect(response).to have_http_status(:success)
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    it "redirects to user_path if user created" do
      post '/users', params: { user: {username: "Renee", email: "renee@example.com", password: "12345678", password_confirmation: "12345678", bio: "It all started a long time ago...."} }
      expect(response).to redirect_to user_path(1)
    end

    it "renders new template if user not created" do
      post '/users', params: { user: {username: "Renee", email: "renee@example.com", password: "", bio: "It all started a long time ago...."} }
      expect(response).to render_template("new")
    end
  end
end