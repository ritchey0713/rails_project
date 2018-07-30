class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :game_type, :play_time, :main_setup, :score
  has_many :users
  has_many :rankings
  end
