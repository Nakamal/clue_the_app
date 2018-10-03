class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.string :game_id
      t.integer :card_id
      t.integer :participation_id
      t.boolean :classified
      t.integer :show_to

      t.timestamps
    end
  end
end
