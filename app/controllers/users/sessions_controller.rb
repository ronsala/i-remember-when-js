# frozen_string_literal: true

# For authenticating and authorizing users.
class Users::SessionsController < Devise::SessionsController
  # GET /users/sign_in
  def new
    @user = User.new
  end

  # POST /account/sign_in
  def create
    @user = User.find_by(email: sign_in_params[:email])
    session[:current_user_id] = @user.id
    redirect_to @user
  end

  # DELETE account/sign_out
  def destroy
    session.clear
    redirect_to '/'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :password, :remember_me)
    end
  end
end
