class CreateRoofs < ActiveRecord::Migration[5.0]
  def change
    create_table :roofs do |t|
      t.string :name
      t.string :dress_code
      t.string :location
      t.string :entertainment
      t.string :dog
      t.string :food
      t.string :bar
      t.integer :price_range
      t.integer :ig_rating
    end
  end
end
