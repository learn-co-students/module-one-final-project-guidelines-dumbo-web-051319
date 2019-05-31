class AddProfilePicturePathToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :profile_picture_path, :string
  end
end
