class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :character_id
      t.string :current_location
      t.integer :current_location_x
      t.integer :current_location_y

      t.timestamps
    end
  end
end
