class AddStartGameToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :start_game, :boolean
  end
end
