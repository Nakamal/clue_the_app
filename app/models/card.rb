class Card < ApplicationRecord
  belongs_to :designatable, polymorphic: true
  validates :designatable_id, uniqueness: { scope: :designatable_type }
  has_many :deckings
  has_many :games, through: :deckings 
end