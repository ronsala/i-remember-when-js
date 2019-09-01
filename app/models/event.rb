# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :memories
  has_many :users, through: :memories

  validate :country_selected?
  validates :year, numericality: { message: 'Please select a year'}
  validates :name, presence: :true
  validates :description, presence: :true

  def country_selected?
    if country == "Select"
      errors.add(:country, "Please select a country")
    end
  end
end
