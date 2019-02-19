class AnswerImageRelationship < ApplicationRecord
  belongs_to :answer_image
  belongs_to :answer
end
