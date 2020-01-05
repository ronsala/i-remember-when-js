# frozen_string_literal: true

# For authenticating and authorizing users.
class Users::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_signed_out_user
  # GET /users/sign_in
  def new
    @user = User.new
  end

  # POST /users/sign_in
  def create
    @user = User.find_by(email: sign_in_params[:email])
    if @user&.valid_password?(sign_in_params[:password])
      #TODO
      # session[:current_user] = current_user
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to user_session_path
    end
  end

  # DELETE users/sign_out
  def destroy
    session.clear
    redirect_to '/'
  end

  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to @user
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
