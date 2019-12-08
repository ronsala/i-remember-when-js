# frozen_string_literal: true

# Describes a member of the community's account.
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2]
  has_many :memories
  #TODO: Add `has_many :events`?
  has_many :events, through: :memories

  validates :username, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email # TODO: Gets all info in original block.
      user.username = auth.info.name
      # user.token = auth.credentials.token
      # user.expires = auth.credentials.expires
      # user.expires_at = auth.credentials.expires_at
      # user.refresh_token = auth.credentials.refresh_token
      user.password = Devise.friendly_token
    end
  end
end
