class Participation < ApplicationRecord
  belongs_to :player
  belongs_to :game
  has_many :deckings
  has_many :sheet_infos
  belongs_to :character
end
