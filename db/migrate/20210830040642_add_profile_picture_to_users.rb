class AddProfilePictureToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :image_file_name, :string
    add_column :users, :image_content_type, :string
    add_column :users, :image_file_size, :integer
  end
end
