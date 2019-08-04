# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :memories
  has_many :users, through: :memories
end
