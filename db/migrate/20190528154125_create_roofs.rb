class CreateRoofs < ActiveRecord::Migration[5.0]
  def change
    create_table :roofs do |t|
      t.string :name
      t.string :dress_code
      t.integer :price_range
      t.string :location
      t.string :entertainment
      t.string :dog
      t.string :food
      t.string :chill
      t.string :happy_hour
      t.integer :ig_rating
    end
  end
end
