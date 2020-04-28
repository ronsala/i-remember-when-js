class MemorySerializer < ActiveModel::Serializer
  attributes :id, :event_id, :user_id, :title, :body, :created_at, :updated_at
  belongs_to :user
  belongs_to :event
end
