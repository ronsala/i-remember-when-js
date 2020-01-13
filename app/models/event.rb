# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :memories
  has_many :users, through: :memories

  validates :date, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :country, presence: true

  scope :by_date, -> { order(date: :asc).order(date: :asc) }
end
