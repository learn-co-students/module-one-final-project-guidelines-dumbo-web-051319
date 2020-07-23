class ChangeTypeToFortunes < ActiveRecord::Migration[5.0]
  def change
    add_column :fortunes, :fortune_type, :string
    remove_column :fortunes, :type
  end
end
