class UpdateDoctorsColumn < ActiveRecord::Migration[4.2]
  def change
    update_table :doctors do |t|
      :hospital = hospital_id
    end
  end
end
