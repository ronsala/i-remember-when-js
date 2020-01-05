# frozen_string_literal: true

# Allows user to signup and signin via third party authenication.
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      # binding.pry
      sign_in @user, event: :authentication
      # flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
      # binding.pry
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_path, alert: @user.errors.full_messages.join("\n")
    end
  end

  def passthru
    super
  end
end
