class CreateQuestionLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :question_likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :question, foreign_key: true, null: false
      t.timestamps
    end
  end
end
