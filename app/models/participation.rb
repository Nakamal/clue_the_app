class Participation < ApplicationRecord
  validates :player_id, uniqueness: { scope: :game_id }
  validates :character_id, uniqueness: { scope: :game_id }
  belongs_to :player
  belongs_to :game
  has_many :deckings
  has_many :cards, through: :deckings
  has_many :sheet_infos
  belongs_to :character

  def grouped_sheet_infos
    sheet_infos.group_by {|sheet_info| sheet_info.card.designatable_type }
  end

  def my_turn?
    game.current_character == character_id
  end

  def change_location(new_location)
    update(current_location: new_location) if Room.find_by(name: new_location)
  end

  def suggestions
    character_id_list = @participation.game.characters.order(game_order: :desc).pluck(:id)
    position = character_id_list.index(@participation.character_id)
    character_id_list.rotate(position + 1)

    character_id_list.each do |character_id|
      checking_cards = @participation.game.participations.find_by(character_id: character_id).cards.map {|card| card.subject }
      suggested = [room_object, weapon_object, character_object]
      cross_over = (checking_cards & suggested).sample
    end
  end

  def setup_detective_sheet
    sheet_infos.where(card_id: cards.ids).update_all(guess: "confirmed")
  end

  def update_detective_sheet(room_object, weapon_object, character_object)
    character_id_list = game.characters.order(game_order: :desc).pluck(:id)
    position = character_id_list.index(character_id)
    character_id_list.rotate(position + 1)

    character_id_list.each do |character_id|

      checking_cards = game.participations.find_by(character_id: character_id).cards.map { |card| card.subject }
      suggested = [room_object, weapon_object, character_object]
      cross_over = (checking_cards & suggested).sample
      
      if cross_over
        associated_card = cross_over.card
        sheet_infos.find_by(card_id: associated_card.id).update(guess: "confirmed")

        return cross_over  
      end
    end
  end
end
