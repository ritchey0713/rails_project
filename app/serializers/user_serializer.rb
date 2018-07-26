class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :console, :goal
  has_many :games
end
