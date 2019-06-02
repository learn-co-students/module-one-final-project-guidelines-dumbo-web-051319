class AddColumnPasswordToPatients < ActiveRecord::Migration[4.2]

  def change
    add_column :patients, :password, :string
  end

end
