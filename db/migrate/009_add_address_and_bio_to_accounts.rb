class AddAddressAndBioToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :address, :string
    add_column :accounts, :bio, :text
  end
end
