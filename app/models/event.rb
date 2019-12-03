# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :memories
  has_many :users, through: :memories

  validate :country_selected?
  # TODO: 'You can pass "Select" as an option to the `collection_select` helper so it will not register as input. Just create your form, using `collection_select` as normal and add `{ include_blank: "Select A Country" }` at the end before closing the erb tag.'

  validate :date_selected?
  # TODO, :true { message: 'Please select a date' }
  validates :name, presence: true
  validates :description, presence: true
end
