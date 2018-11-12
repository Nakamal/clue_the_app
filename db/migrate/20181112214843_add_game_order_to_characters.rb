class AddGameOrderToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :game_order, :integer
  end
end
