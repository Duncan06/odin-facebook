class DropComment < ActiveRecord::Migration[6.1]
  def up
    drop_table :comments
  end

  def down
    raise ActiveRecorde::IrreversibleMigration
  end
end
