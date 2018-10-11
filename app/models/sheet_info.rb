class SheetInfo < ApplicationRecord
  belongs_to :card
  belongs_to :participation
  has_one :player, through: :participation

  enum guess: {unknown: 0, unconfirmed: 1, confirmed: 2}

  def printed_status
    case guess
    when "unknown"
      ""
    when "unconfirmed"
      "?"
    when "confirmed"
      "X"
    end
  end
end
