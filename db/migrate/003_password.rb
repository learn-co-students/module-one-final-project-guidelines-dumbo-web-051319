class Password < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :password, :string
  end
end
