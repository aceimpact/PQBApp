class QuestionImage < ApplicationRecord
  belongs_to :question
  belongs_to :image
end
