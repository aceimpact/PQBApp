class ChangeColumnNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :name, true
    change_column_null :users, :icon, true
    change_column_null :users, :grade, true
  end
end
