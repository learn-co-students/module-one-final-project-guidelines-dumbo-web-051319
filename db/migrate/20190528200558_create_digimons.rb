class CreateDigimons < ActiveRecord::Migration[5.0]
  def change
    create_table :digimons do |t|
      t.integer :digi_card_id
      t.string :name
      t.string :race
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.text :main_skill
      t.text :bio
      t.boolean :has_evo
      t.integer :evolution_id
      t.timestamps
    end
  end
end
