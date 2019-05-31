class AddPicturePathToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :picture_path, :string
  end
end
