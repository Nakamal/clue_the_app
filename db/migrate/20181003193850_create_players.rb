class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :username
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
