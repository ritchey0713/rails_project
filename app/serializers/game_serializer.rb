class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :game_type, :play_time, :main_setup, :score
  belongs_to :user
  has_many :rankings do
    attributes :game_id, :user_id
  end
end
