class CreatePatients < ActiveRecord::Migration[4.2]

  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.string :previous_conditions
    end
  end
  
end
