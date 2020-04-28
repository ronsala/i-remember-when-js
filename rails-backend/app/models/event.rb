# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :memories, dependent: :destroy
  has_many :users, through: :memories

  validates :date, presence: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :country, presence: true

  scope :by_date, -> { order(date: :asc) }

  # Converts date hash in event_params to Date object.
  def self.convert_date(event_params)
    %w[1 2 3].map { |element| event_params["date(#{element}i)"].to_i }
  end

  # Checks presence of day, month, and year.
  def self.date_present?(event_params)
    %w[1 2 3].map { |element| event_params["date(#{element}i)"] }.to_a.none? { |element| element == '' }
  end
end
