class User < ApplicationRecord
  has_secure_password
  has_many :rankings
  has_many :games, through: :rankings
  validates :name, presence: true
  validates :password_digest, presence: true
end
