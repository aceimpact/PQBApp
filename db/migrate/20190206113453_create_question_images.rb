class CreateQuestionImages < ActiveRecord::Migration[5.1]
  def change
    create_table :question_images do |t|
      t.references :question, foreign_key: true, null: false
      t.references :image, foreign_key: true, null: false
      t.timestamps
    end
  end
end
