# frozen_string_literal: true

class Event < ApplicationRecord
  # belongs_to :creator, foreign_key: 'user_id',class_name: "User"
  # belongs_to :user
  has_many :memories
  has_many :users, through: :memories

  validates :date, presence: true
  # # TODO, :true { message: 'Please select a date' }
  validates :name, presence: true
  validates :description, presence: true
  validates :country, presence: true
end
