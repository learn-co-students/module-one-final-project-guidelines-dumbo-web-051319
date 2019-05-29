class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :digimon_id
      t.timestamps
    end
  end
end
