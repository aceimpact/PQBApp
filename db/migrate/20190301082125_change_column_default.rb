class ChangeColumnDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :grade, 'integer USING CAST(grade AS integer)', default: 0, null: false
  end
end
