# frozen_string_literal: true

# See https://guides.rubyonrails.org/action_controller_overview.html.

require 'google/apis/people_v1'
require 'google/api_client/client_secrets.rb'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def contacts
    secrets Google::API:Client::ClientSecrets.new(
      {
        "web" =>
          {
            "access_token" => current_user.token,
            "refresh_token" => current_user.refresh_token,
            "client_id" => ENV['google_client_id'],
            "client secret" => ENV['google_secret']
          }
      }
    )
    service = People::PeopleServiceService.new
    service.authorization = secrets.to_authorization

    response = service.list_person_connections(
      'people/me',
      person_fields: ['names', 'emailAddresses']
    )
    render json: response
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username bio admin email])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username email bio admin])
  end
end
