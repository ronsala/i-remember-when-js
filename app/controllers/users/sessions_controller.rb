# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  # GET /users/sign_in
  def new
    render '/users/sign_in'
  end

  # POST /users/sign_in
  def create
    @user = User.find_or_create_by(username: user_params[:username])
    session[:current_user_id] = @user.id
    redirect_to @user
  end
end
