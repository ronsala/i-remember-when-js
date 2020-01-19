# frozen_string_literal: true

# For authenticating and authorizing users.
class Users::SessionsController < Devise::SessionsController
  # before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_signed_out_user
  # GET /users/sign_in
  def new
    # binding.pry
    # @user = User.new
    super
  end

  # POST /users/sign_in
  def create
    super
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
end
