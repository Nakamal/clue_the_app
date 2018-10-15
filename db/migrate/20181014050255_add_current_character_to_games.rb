class AddCurrentCharacterToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :current_character, :integer
  end
end
