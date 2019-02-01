class ChangeDatatypeSubjectOfQuestions < ActiveRecord::Migration[5.1]
  def change
    change_column :questions, :subject, 'integer USING CAST(subject AS integer)', default: 0, null: false
  end
end
