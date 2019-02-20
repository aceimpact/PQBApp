class CreateAnswerImages < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_images do |t|
      t.text :file, null: false
      t.timestamps
    end
  end
end
