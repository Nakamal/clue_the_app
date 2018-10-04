class Game < ApplicationRecord
  has_many :deckings
  has_many :cards, through: :deckings
  has_many :participations
  has_many :players, through: :participations
  has_many :sheet_infos
end
