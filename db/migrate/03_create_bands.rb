class CreateBands < ActiveRecord::Migration[4.2]
  def change
    create_table :bands do |t|
      t.string :name
    end
  end
end
