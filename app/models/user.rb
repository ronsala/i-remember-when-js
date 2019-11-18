# frozen_string_literal: true

# Describes a member of the community's account.
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  has_many :memories
  has_many :events, through: :memories

  validates :username, presence: true, uniqueness: true

  # todo: From Facebook auth. rm?
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #     user.name = auth.info.name   # assuming the user model has a name
  #     user.image = auth.info.image # assuming the user model has an image
  #     # If you are using confirmable and the provider(s) you use validate emails,
  #     # uncomment the line below to skip the confirmation emails.
  #     # user.skip_confirmation!
  #   end
  # end

  # todo: From Facebook auth. rm?
  # def self.from_omniauth(auth)
  #   where(email: auth.info.email).first_or_initialize do |user|
  #     user.username = auth.info.name
  #     user.email = auth.info.email
  #     user.password = SecureRandom.hex
  #   end
  # end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      # binding.pry
      user.email = auth.info.email #todo Gets all info in original block.
      user.name =auth.info.name
      # user.token = auth.credentials.token
      # user.expires = auth.credentials.expires
      # user.expires_at = auth.credentials.expires_at
      # user.refresh_token = auth.credentials.refresh_token
      user.password = Devise.friendly_token
    end
  end

  def self.new_with_session(params, session)
    # binding.pry
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end
end
