# frozen_string_literal: true

# See https://guides.rubyonrails.org/action_controller_overview.html.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_user
    binding.pry
    # if logged_in?
      User.find_by(id: session[:user_id])
    # end
  
  end

  def logged_in?
    !!current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username bio admin email])
  end
end
