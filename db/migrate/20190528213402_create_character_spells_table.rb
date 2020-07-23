class CreateCharacterSpellsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :character_spells do |t|
      t.integer :character_id
      t.integer :spell_id
    end
  end
end
