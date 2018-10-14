class Game < ApplicationRecord
  has_many :deckings
  has_many :cards, through: :deckings
  has_many :participations
  has_many :players, through: :participations
  has_many :sheet_infos

  def available_characters
    Character.all - participations.map {|participation| participation.character }
  end

  def build_deck
    classified_cards = []
    classified_cards << Character.all.sample.card 
    classified_cards << Weapon.all.sample.card
    classified_cards << Room.all.sample.card
    
    classified_cards.each do |classified_card|
      Decking.create(card_id: classified_card.id, game_id: id, classified: true)
    end
    
    cards = Card.all - classified_cards
    cards.shuffle!

    cards.each_with_index do |card, index|
      Decking.create(card_id: card.id, game_id: id, participation_id: participations[index % participations.length].id )
    end

    participations.each do |participation|
      Card.all.each do |card|
        SheetInfo.create(card_id: card.id, participation_id: participation.id, guess: "unknown")
      end
    end
  end
end
