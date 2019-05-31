class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :post_id
      t.integer :account_id
    end
  end
end
