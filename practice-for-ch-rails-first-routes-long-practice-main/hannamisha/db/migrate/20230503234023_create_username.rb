class CreateUsername < ActiveRecord::Migration[7.0]
  def change
    create_table :usernames do |t|
      add_column :users, :username, :string, unique: true
      t.timestamps
    end
  end
end
