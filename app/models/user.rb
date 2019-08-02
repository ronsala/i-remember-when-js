class User < ApplicationRecord
  has_many :memories
  has_many :events, through: :memories
end
