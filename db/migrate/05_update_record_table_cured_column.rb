class UpdateRecordTableCuredColumn < ActiveRecord::Migration[4.2]

    def change
      rename_column :records, :cured?, :cured
    end
  
  end