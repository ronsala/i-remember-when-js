class Event < ApplicationRecord
  has_many :memories
  has_many :users, through: :memories
end
