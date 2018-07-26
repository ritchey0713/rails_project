class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :game_type, :play_time, :main_setup, :score
  belongs_to :users
  end
