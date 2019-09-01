# frozen_string_literal: true

class User < ApplicationRecord
  has_many :memories
  has_many :events, through: :memories

  validates :username, presence: true, uniqueness: :true
  validates :email, uniqueness: :true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :password, confirmation: true, length: { in: 8..20 }
  validates :password_confirmation, presence: :true

  has_secure_password
end
