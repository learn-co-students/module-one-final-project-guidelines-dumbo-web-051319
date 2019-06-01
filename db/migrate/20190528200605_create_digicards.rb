class CreateDigicards < ActiveRecord::Migration[5.0]
  def change
    create_table :digicards do |t|
      t.integer :digimon_id
      t.integer :user_id
      t.timestamps
    end
  end
end
