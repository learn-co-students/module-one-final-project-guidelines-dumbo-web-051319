class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :post_id
      t.integer :account_id
    end
  end
end
