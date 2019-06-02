class CreateRecords < ActiveRecord::Migration[4.2]

  def change
    create_table :records do |t|
      t.string :illness
      t.string :description
      t.integer :patient_id
      t.integer :doctor_id
      t.boolean :cured?
      t.timestamps 
    end
  end

end
