# frozen_string_literal: true

# For authenticating and authorizing users.
class Users::SessionsController < Devise::SessionsController
  # GET /users/sign_in
  def new
    render '/users/sign_in'
  end

  # POST /users/sign_in
  def create
    @user = User.find_by(sign_in_params)
    session[:current_user_id] = @user.id
    redirect_to @user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username)
    end
  end
end
