class AddStatusToFriend < ActiveRecord::Migration[6.1]
  def change
    add_column :friends, :status, :integer
  end
end
