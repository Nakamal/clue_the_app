class SheetInfo < ApplicationRecord
  has_many :cards
  belongs_to :participation
  belongs_to :players, through: :participation
end
