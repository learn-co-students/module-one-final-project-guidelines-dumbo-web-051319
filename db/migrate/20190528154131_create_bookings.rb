class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :roof_id
      t.integer :user_id
      t.datetime :date_time
      t.integer :party_size
    end
  end
end
