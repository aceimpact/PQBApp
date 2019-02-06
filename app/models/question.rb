class Question < ApplicationRecord
  belongs_to :user
  has_many :question_images
  has_many :images, through: :question_images, dependent: :destroy

  validates :subject, presence: true
  validates :content, presence: true

  enum subject:{japanese: 0, math: 1, society: 2, science: 3, english: 4}
end
