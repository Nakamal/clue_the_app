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
end
