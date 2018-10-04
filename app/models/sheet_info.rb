class SheetInfo < ApplicationRecord
  belongs_to :card
  belongs_to :participation
  has_one :player, through: :participation
end
