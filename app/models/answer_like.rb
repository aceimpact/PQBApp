class AnswerLike < ApplicationRecord
  belongs_to :answer
  belongs_to :user

  validates :answer_id, presence: true
  validates :user_id, presence: true
  validates :user_id, :uniqueness => {:scope => :answer_id}
end
