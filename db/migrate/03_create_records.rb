class CreateRecords < ActiveRecord::Migration[4.2]

  def change
    create_table :records do |t|
      t.string :name
      t.string :description
      t.integer :patient_id
      t.integer :doctor_id
      t.boolean :cured?
      t.timestamp 
    end
  end

end
