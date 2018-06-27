class Game < ApplicationRecord
  has_many :rankings
  has_many :users, through: :rankings
  validates :name, presence: true
  validates :play_time, numericality: true

  scope :pro_level, ->(play_time) { where("play_time > 200", play_time ) }

  def rank_symbol(score)
    game = self.score
      if game > 2500
        "You are a platinum rank CONGRATS!"
      elsif 2000 < game && game < 2499
        "You are a gold rank!"
      elsif 1500 < game && game < 1999
        "You are a silver rank"
      elsif 1000 < game && game < 1499
        "you are a bronze rank"
      else
        "you are a bronze rank :( keep trying!"
      end
  end
end
