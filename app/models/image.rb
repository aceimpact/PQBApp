class Image < ApplicationRecord
  has_many :question_images
  has_many :questions, through: :question_images, dependent: :destroy

  validates :file, presence: true
end
