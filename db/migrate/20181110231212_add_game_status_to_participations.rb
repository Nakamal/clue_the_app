class AddGameStatusToParticipations < ActiveRecord::Migration[5.2]
  def change
    add_column :participations, :game_status, :boolean
  end
end
