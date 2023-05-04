class FixTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :usernames
    remove_column :users, :username
  end
end
