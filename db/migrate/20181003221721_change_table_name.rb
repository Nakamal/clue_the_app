class ChangeTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :decks, :deckings
  end
end
