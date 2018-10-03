class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :image
      t.integer :location_x
      t.integer :location_y

      t.timestamps
    end
  end
end
