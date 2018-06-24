class Game < ApplicationRecord
  has_many :rankings
  has_many :users, through: :rankings
  validates :name, presence: true
  validates :play_time, numericality: true

  def current_user_games(user)
    Game.where("games.user_id = ?", user.id)
  end
  
end
