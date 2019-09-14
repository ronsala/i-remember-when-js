# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :memories
  has_many :users, through: :memories

  # validate :country_selected? # todo: 'You can pass "Select" as an option to the `collection_select` helper so it will not register as input. Just create your form, using `collection_select` as normal and add `{ include_blank: "Select A Country" }` at the end before closing the erb tag.'

  validates :year, numericality: { message: 'Please select a year' }
  validates :name, presence: true
  validates :description, presence: true
end
