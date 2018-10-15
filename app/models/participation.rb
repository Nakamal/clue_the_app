class Participation < ApplicationRecord
  belongs_to :player
  belongs_to :game
  has_many :deckings
  has_many :cards, through: :deckings
  has_many :sheet_infos
  belongs_to :character

  def grouped_sheet_infos
    sheet_infos.group_by {|sheet_info| sheet_info.card.designatable_type }
  end

  def my_turn?
    game.current_character == character_id
  end

  def change_location(new_location)
    update(current_location: new_location) if Room.find_by(name: new_location)
  end
end
