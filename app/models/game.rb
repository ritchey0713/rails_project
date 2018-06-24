class Game < ApplicationRecord
  has_many :rankings
  has_many :users, through: :rankings
  validates :name, presence: true
  validates :play_time, numericality: true

end
