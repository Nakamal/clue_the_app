class Character < ApplicationRecord
  has_one :card, as: :designatable
  has_many :participations
end
