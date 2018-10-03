class Card < ApplicationRecord
  belongs_to :designatable, polymorphic: true
  validates :designatable_id, uniqueness: { scope: :designatable_type }
  
end