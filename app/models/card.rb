class Card < ApplicationRecord
  belongs_to :designatable, polymorphic: true
  validates :designatable_id, uniqueness: { scope: :designatable_type }
  has_many :deckings
  has_many :games, through: :deckings 

  def subject
    case designatable_type 
    when "Character" 
      Character.find(designatable_id)
    when "Weapon"
      Weapon.find(designatable_id)
    when "Room"
      Room.find(designatable_id)
    end 
  end
end