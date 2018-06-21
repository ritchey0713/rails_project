class User < ApplicationRecord
  has_secure_password
  has_many :rankings
  has_many :games, through: :rankings
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :password, length: {in: 6..20}
end
