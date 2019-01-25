class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :icon, :string, null: false
    add_column :users, :teacher, :boolean, default: false, null: false
    add_column :users, :grade, :integer, null: false
    add_column :users, :admin, :boolean, default: false, null: false
  end
end
