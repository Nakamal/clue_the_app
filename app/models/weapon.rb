class Weapon < ApplicationRecord
  has_one :card, as: :designatable
end
