class CreateCharactersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :race
      t.string :class_name
    end
  end
end
