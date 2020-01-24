# frozen_string_literal: true

class Memory < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
end
