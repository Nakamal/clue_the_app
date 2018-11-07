class Decking < ApplicationRecord
  belongs_to :participation, optional: true
  belongs_to :game
  belongs_to :card
end
