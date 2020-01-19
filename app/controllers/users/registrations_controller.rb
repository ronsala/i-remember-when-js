# frozen_string_literal: true

# For user account management.
class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :authenticate_user!, only: %i[edit update destroy]


  # GET /users/sign_up
  def new
    super
  end

  # POST /users
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    # @user = User.find_by(username: current_user.username)
    # binding.pry
    # if @user.update(email:
    #   account_update_params[:email])
    #   redirect_to @user
    # else
    #   render 'edit'
    # end
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected

  # The path used after sign up.
  def after_sign_up_path_for(user)
    super(user)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
