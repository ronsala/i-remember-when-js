# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'user_id',class_name: "User"
  belongs_to :user
  has_many :memories
  has_many :users, through: :memories
  # TODO:
  # validate :country_selected?
  #  'You can pass "Select" as an option to the `collection_select` helper so it will not register as input. Just create your form, using `collection_select` as normal and add `{ include_blank: "Select A Country" }` at the end before closing the erb tag.'

  validates :date, presence: true
  # TODO, :true { message: 'Please select a date' }
  validates :name, presence: true
  validates :description, presence: true
end
