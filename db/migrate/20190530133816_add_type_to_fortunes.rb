class AddTypeToFortunes < ActiveRecord::Migration[5.0]
  def change
    add_column :fortunes, :type, :string
  end
end
