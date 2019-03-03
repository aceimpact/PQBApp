class Question < ApplicationRecord
  belongs_to :user
  has_many :question_images, dependent: :destroy
  has_many :images, through: :question_images
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :all_blank
  has_many :answers, dependent: :destroy
  has_many :question_likes, dependent: :destroy

  validates :subject, presence: true
  validates :content, presence: true

  enum subject: { japanese: 0, math: 1, society: 2, science: 3, english: 4 }

  def self.subjects_names
    subjects.keys.map {|subject_key| [I18n.t("enums.question.subject.#{subject_key}"), subject_key]}
  end

  def question_like_user(user_id)
    question_likes.find_by(user_id: user_id)
  end
end
