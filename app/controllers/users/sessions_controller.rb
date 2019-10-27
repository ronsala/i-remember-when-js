# frozen_string_literal: true

# For authenticating and authorizing users.
class Users::SessionsController < Devise::SessionsController
  # GET /account/sign_in
  def new
    @user = User.new
  end

  # POST /account/sign_in
  def create
    # binding.pry
    @user = User.find_by(email: sign_in_params[:email])
    # binding.pry
    if @user&.valid_password?(sign_in_params[:password])
      session[:current_user_id] = @user.id
      redirect_to @user
    else
      redirect_to '/account/sign_in'
    end
  end

  # DELETE account/sign_out
  def destroy
    session.clear
    redirect_to '/'
  end

  protected

  def auth
    request.env['omniauth.auth']
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :password, :remember_me)
    end
  end
end
