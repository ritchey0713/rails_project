class Game < ApplicationRecord
  has_many :rankings
  has_many :users, through: :rankings
  validates :name, presence: true
  validates :play_time, numericality: true

  scope :pro_level, ->(play_time) { where("play_time > 200", play_time ) }
end

end
