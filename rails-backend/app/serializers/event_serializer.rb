class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :description, :date, :user_id, :created_at, :updated_at
  has_many :memories, dependent: :destroy
  has_many :users, through: :memories
end
