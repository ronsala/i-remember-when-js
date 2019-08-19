require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  DatabaseCleaner.clean

  describe "GET index" do
    it "assigns @users" do
      user = User.create!(password: "123")
      get :index
      expect(assigns(:users)).to eq([user])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end
