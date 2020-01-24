# frozen_string_literal: true

# For user account management.
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, only: %i[edit update destroy]

  # GET /users/sign_up
  def new
    super
  end

  # POST /users
  def create
    super
    check_admin_key
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
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

  def check_admin_key
    return unless params[:admin_key] != ''

    if params[:admin_key] == ENV['ADMIN_KEY']
      @user.admin = true
      @user.save
      flash[:notice] = 'Admin account established!'
    else
      flash[:alert] = 'Admin key not recognized. Please update account to have admin status.'
    end
  end
end
