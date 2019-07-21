class User < ApplicationRecord
  has_many :recollections
  has_many :events, through: :recollections
end
