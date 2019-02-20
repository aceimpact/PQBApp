class CreateAnswerImageRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_image_relationships do |t|
      t.references :answer, foreign_key: true, null: false
      t.references :answer_image, foreign_key: true, null: false
      t.timestamps
    end
  end
end
