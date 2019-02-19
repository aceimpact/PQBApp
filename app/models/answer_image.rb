class AnswerImage < ApplicationRecord
  has_many :answer_image_relationships, dependent: :destroy
  has_many :answers, through: :answer_image_relationships

  validates :file, presence: true

  mount_uploader :file, ImagesUploader
end
