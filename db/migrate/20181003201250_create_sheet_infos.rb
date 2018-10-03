class CreateSheetInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :sheet_infos do |t|
      t.integer :card_id
      t.integer :participation_id
      t.integer :guess

      t.timestamps
    end
  end
end
