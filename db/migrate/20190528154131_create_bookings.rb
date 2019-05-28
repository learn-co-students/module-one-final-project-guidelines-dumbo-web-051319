class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :roof
      t.string :user
      t.datetime :date_time
      t.integer :party_size
    end
  end
end
