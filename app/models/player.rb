class Player < ApplicationRecord
  has_many :participations
  has_many :games, through: :participations
end
