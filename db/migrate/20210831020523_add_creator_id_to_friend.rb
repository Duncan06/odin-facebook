class AddCreatorIdToFriend < ActiveRecord::Migration[6.1]
  def change
    add_column :friends, :creator_id, :bigint
  end
end
