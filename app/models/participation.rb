class Participation < ApplicationRecord
  has_many :players
  has_many :games
  has_many :deckings
  has_many :sheet_info
  many_to_many :characters
end
