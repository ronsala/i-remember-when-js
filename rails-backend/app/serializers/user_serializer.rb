class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :admin, :email, :encrypted_password, :created_at, :updated_at, :provider, :uid, :reset_password_token, :reset_password_sent_at
  has_many :memories, dependent: :destroy
  has_many :events, through: :memories
end
