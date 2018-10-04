class Decking < ApplicationRecord
  belongs_to :participation
  belongs_to :game
  belongs_to :card
end
