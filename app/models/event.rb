class Event < ApplicationRecord
  has_many :recollections
  has_many :users, through: :recollections
end
