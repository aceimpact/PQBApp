class ChangeColumnToNotNull < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :name, :string
    change_column :users, :icon, :string
  end

  def down
    change_column :users, :name, :string, null: false
    change_column :users, :icon, :string, null: false
  end
end
