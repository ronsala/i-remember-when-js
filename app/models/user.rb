# frozen_string_literal: true

class User < ApplicationRecord
  has_many :memories
  has_many :events, through: :memories

  attr_accessor :username, :email, :password, :password_confirmation, :bio
  # has_secure_password
end
