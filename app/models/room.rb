class Room < ApplicationRecord
  has_one :card, as: :designatable
end
