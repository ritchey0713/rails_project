class RankingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :game_id, :comment
  belongs_to :game
  belongs_to :user
end
