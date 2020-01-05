# frozen_string_literal: true

# Allows user to signup and signin via third party authenication.
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      session[:user_id] = @user.id
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
      redirect_to @user
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_path, alert: @user.errors.full_messages.join("\n")
    end
  end

  def passthru
    super
  end
end
