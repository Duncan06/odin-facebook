class AddCreatorIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :creator_id, :bigint
  end
end
